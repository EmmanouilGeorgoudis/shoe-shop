package shoeShop;

import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class Repository {


    private Properties p = new Properties();

    Connection con = null;

    public Repository() {
        try {
            p.load(new FileInputStream("Settings.properties"));

            con = DriverManager.getConnection(
                    p.getProperty("connectionString"),
                    p.getProperty("name"),
                    p.getProperty("password")
            );

        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public Customer login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM Customers WHERE name = ? AND UserPassword = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("ID"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("telephone"),
                        rs.getString("city"),
                        rs.getString("UserPassword")
                );
            }
        }
        return null;
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();

        String sql = "select p.ID as productID, p.price, " +
                "m.ID as modelID, m.name as modelName, " +
                "b.ID as brandID, b.name as brandName, " +
                "s.ID as variantID, s.size, s.color " +
                "from Products p " +
                "join Models m on p.ModelID = m.ID " +
                "join Brands b ON m.BrandID = b.ID " +
                "join ShoeVariants s ON p.ShoeVariantID = s.ID " +
                "join Stock st on st.ProductID = p.ID " +
                "where st.StockQuantity > 0";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Brand brand = new Brand(
                        rs.getInt("brandID"),
                        rs.getString("brandName")
                );

                Model model = new Model(
                        rs.getInt("modelID"),
                        rs.getString("modelName"),
                        brand
                );

                ShoeVariant variant = new ShoeVariant(
                        rs.getInt("variantID"),
                        rs.getInt("size"),
                        rs.getString("color")
                );

                Product product = new Product(
                        rs.getInt("productID"),
                        model,
                        variant,
                        rs.getInt("price")
                );

                products.add(product);
            }
        }
        return products;
    }

    public boolean addToCart(int customerId, Integer orderId, int productId, int quantity) {
        String call = "{call AddToCart(?, ?, ?, ?)}";
        try (CallableStatement stmt = con.prepareCall(call)) {
            stmt.setInt(1, customerId);
            if (orderId == null) {
                stmt.setNull(2, Types.INTEGER);
            } else {
                stmt.setInt(2, orderId);
            }
            stmt.setInt(3, productId);
            stmt.setInt(4, quantity);
            stmt.execute();
            return true;
        } catch (SQLException e) {
            System.out.println("Fel inmatning, prova igen: " + e.getMessage());
            return false;
        }
    }
}