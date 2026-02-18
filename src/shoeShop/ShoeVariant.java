package shoeShop;

public class ShoeVariant {

    private int id;
    private int size;
    private String color;

    public ShoeVariant(int id, int size, String color) {
        this.id = id;
        this.size = size;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public int getSize() {
        return size;
    }

    public String getColor() {
        return color;
    }

    @Override
    public String toString() {
        return "Size: " + size + ", Color: " + color;
    }
}
