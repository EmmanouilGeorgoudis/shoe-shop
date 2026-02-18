# ShoeShop Database Project

## Description

This project features a MySQL database designed to store and manage shoe shop information in a way that is compatible
with an object-oriented structure.

While the current application allows users to browse and select pre-defined products, the database is capable of more
advanced operations, such as:

- Sorting products by size, color, brand, or category
- Managing product variants and stock levels
- Supporting scalable object-oriented interactions in future application features

This design ensures that the database is flexible and can grow alongside the application, making it suitable for further
enhancements and graphical representations of the data.

## Technologies
- Java
- MySQL
- JDBC

## Setup Instructions

1. Copy `Settings.example.properties` and rename it to `Settings.properties`.

2. Fill in your database username and password.
   > Do **not** use real personal passwords.

3. In the `Settings.properties` file, set the JDBC URL as follows:
   
   ```jdbc:mysql://localhost:3306/shoeShop?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true```

4. Run the SQL scripts in `/database` in the following order:
   - `schema.sql`
   - `data.sql`
   - `stored_procedures.sql`

5. For quick login, you can create a test user in MySQL (these credentials must match those in `Settings.properties`):

```sql
-- Replace 'your_username' and 'your_password' with your own credentials
CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON shoeshop.* TO 'your_username'@'localhost';
```

6. Open the project in IntelliJ and run the application.

7. You can now use the pre-stored example account in the database:
* Username: Manolis Manolides
* Password: ManoPass

Check the Customer table for additional fake usernames and passwords.
This account is for testing purposes only. Do not use real personal passwords.
