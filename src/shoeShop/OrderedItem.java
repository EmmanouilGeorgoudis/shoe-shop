package shoeShop;

public class OrderedItem {

    private int id;
    private Order order;
    private Product product;
    private int itemQuantity;

    public OrderedItem(int id, Order order,
                       Product product, int itemQuantity) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.itemQuantity = itemQuantity;
    }

    public int getId() {
        return id;
    }

    public Order getOrder() {
        return order;
    }

    public Product getProduct() {
        return product;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }
}
