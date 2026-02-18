package shoeShop;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws SQLException {
        Scanner scan = new Scanner(System.in);
        Repository repo = new Repository();

        Customer customer = null;
        int choice = 0;
        while (customer == null) {
            System.out.print("Användarnamn: ");
            String username = scan.nextLine();
            System.out.print("Lösenord: ");
            String password = scan.nextLine();
            customer = repo.login(username, password);
            if (customer == null) {
                System.out.println("Fel användarnamn eller lösenord. Försök igen.");
            }
        }

        System.out.println("Välkommen, " + customer.getName() + "!");
        Integer orderId = null;

        List<Product> products = repo.getAllProducts();

        if (products.isEmpty()) {
            System.out.println("Inga produkter finns i lager.");
            return;
        }

        while (true) {
            System.out.println("\nAlla produkter:");
            for (int i = 0; i < products.size(); i++) {
                System.out.println((i + 1) + ". " + products.get(i));
            }

            System.out.print("Välj produktnummer att lägga i kundvagnen (0 för att avsluta): ");


            try {
                choice = Integer.parseInt(scan.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Du måste ange en siffra.");
                continue;
            }

            if (choice == 0) break;

            if (choice < 1 || choice > products.size()) {
                System.out.println("Ogiltigt val. Försök igen.");
                continue;
            }

            Product selectedProduct = products.get(choice - 1);

            System.out.print("Ange antal: ");

            int quantity;
            try {
                quantity = Integer.parseInt(scan.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Du måste ange en siffra.");
                continue;
            }

            boolean success = repo.addToCart(
                    customer.getId(),
                    orderId,
                    selectedProduct.getId(),
                    quantity
            );

            if (success) {
                System.out.println("Produkten lades till i kundvagnen!");
            } else {
                System.out.println("Misslyckades med att lägga till produkten.");
            }
        }

        System.out.println("Tack för ditt besök!");
    }
}