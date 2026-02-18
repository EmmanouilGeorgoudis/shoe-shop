package shoeShop;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Order {

    private int id;
    private Customer customer;
    private LocalDate orderDate;
    private boolean paymentStatus;
    private List<OrderedItem> orderedItems;

    public Order(int id, Customer customer,
                 LocalDate orderDate, boolean paymentStatus) {
        this.id = id;
        this.customer = customer;
        this.orderDate = orderDate;
        this.paymentStatus = paymentStatus;
        this.orderedItems = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public List<OrderedItem> getOrderedItems() {
        return orderedItems;
    }

    public void addItem(OrderedItem item) {
        orderedItems.add(item);
    }
}
