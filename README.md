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
1. Copy `Settings.example.properties` and rename to `Settings.properties`.
2. Fill in your database URL, username, and password.
3. Run the SQL scripts in `/database` in order:
    - `schema.sql`
    - `data.sql`
    - `stored_procedures.sql`
4. Read "Tips for Quick Login". Your username and password have to match those in Settings.properties
5. Open the project in IntelliJ and run the application.

## Tips for Quick Login
If you want to quickly create a MySQL user to test the application,
you can run the following **example** SQL commands:

```sql
-- Replace 'your_username' and 'your_password' with your own credentials
CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON shoeshop.* TO 'your_username'@'localhost';