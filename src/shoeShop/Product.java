package shoeShop;

public class Product {

    private int id;
    private Model model;
    private ShoeVariant variant;
    private int price;

    public Product(int id, Model model, ShoeVariant variant, int price) {
        this.id = id;
        this.model = model;
        this.variant = variant;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public Model getModel() {
        return model;
    }

    public ShoeVariant getVariant() {
        return variant;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {

        StringBuilder sb = new StringBuilder();

        sb.append(model.getBrand().getName())
                .append(" ")
                .append(model.getName())
                .append(" | Storlek: ")
                .append(variant.getSize())
                .append(" | Färg: ")
                .append(variant.getColor())
                .append(" | Pris: ")
                .append(price)
                .append(" kr");

        if (!model.getCategories().isEmpty()) {
            sb.append("\nKategorier: ");

            for (int i = 0; i < model.getCategories().size(); i++) {
                sb.append(model.getCategories().get(i).getName())
                        .append(i < model.getCategories().size() - 1 ? ", " : "");
            }
        }


        return sb.toString();
    }

}
