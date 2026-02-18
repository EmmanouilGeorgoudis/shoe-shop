package shoeShop;

public class Customer {

    private int id;
    private String name;
    private String email;
    private String telephone;
    private String city;
    private String userPassword;

    public Customer(
            int id, String name, String email,
            String telephone, String city, String userPassword) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.telephone = telephone;
        this.city = city;
        this.userPassword = userPassword;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getUserPassword() {
        return userPassword;
    }
}