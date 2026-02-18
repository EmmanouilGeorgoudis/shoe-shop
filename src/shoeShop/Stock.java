package shoeShop;

public class Stock {

    private Product product;
    private int stockQuantity;

    public Stock(Product product, int stockQuantity) {
        this.product = product;
        this.stockQuantity = stockQuantity;
    }

    public Product getProduct() {
        return product;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void decreaseStock(int quantity) {
        this.stockQuantity -= quantity;
    }
}
