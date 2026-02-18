drop database if exists ShoeShop;
create database ShoeShop;
use ShoeShop;

create table Brands
(ID int not null auto_increment primary key,
name varchar(30) not null,
unique(name));

create table Models
(ID int not null auto_increment primary key,
name varchar(30) not null,
BrandId int,
foreign key (BrandID) references Brands(ID) on delete set null);

create table Categories
(ID int not null auto_increment primary key,
name varchar(30) not null,
unique(name));

create table BelongTo
(ModelID int,
CategoryID int,
foreign key (ModelID) references Models(ID) on delete cascade,
foreign key (CategoryID) references Categories(ID) on delete cascade);

create table ShoeVariants
(ID int not null auto_increment primary key,
size int,
color varchar(20));

create table Products
(ID int not null auto_increment primary key,
ModelID int,
ShoeVariantID int,
price int,
foreign key (ModelID) references Models(ID),
foreign key (ShoeVariantID) references ShoeVariants(ID));

create table Customers
(ID int not null auto_increment primary key,
name varchar(40) not null,
email varchar(40),
telephone varchar(40),
city varchar(40),
UserPassword varchar(50));

create table Stock
(ProductID int not null,
StockQuantity int,
foreign key (ProductID) references Products(ID));

create table Orders
(ID int not null auto_increment primary key,
CustomerID int not null,
OrderDate date not null,
PaymentStatus boolean,
foreign key (CustomerID) references Customers(ID));

create table OrderedItems
(ID int not null auto_increment primary key,
OrderID int not null,
ProductID int not null,
ItemQuantity int not null,
foreign key (OrderID) references Orders(ID) on delete cascade,
foreign key (ProductID) references Products(ID));

insert into Brands (name) values
('Reverse'), ('Eko'), ('Monkey'), ('Donkey'), ('Dr.Manos');

insert into Models (name, BrandID) values
('Aero', 5), ('Dry', 2), ('Jump&Hunk', 1),
('Loyal', 4), ('GoPro', 3), ('GoPro', 4);

insert into Categories (name) values
('Sport'), ('Adult'), ('Child'),
('Boots'), ('Sandals');

insert into BelongTo (ModelID, CategoryID) values
(1,1), (1,4), (3,3), (2,4), (5,1);

insert into ShoeVariants (size, color) values
(40, 'Black'), (41, 'Black'), (42, 'Black'),
(40, 'White'), (41, 'White'), (42, 'White'),
(40, 'Yellow'), (41, 'Yellow'), (20, 'Yellow');

insert into Products (ModelID, ShoeVariantID, price) values
(1,1,2500), (1,7,2500), (5,9,790), (4,5,600),
(2,5,3250), (1,6,4150), (5,2,790), (3,9,459);

insert into Customers (name, email, telephone, city, userpassword) values
('Manolis Manolides', 'manolis@yahoo.com', '123-0', 'Devilburg', 'ManoPass'),
('Jonas Jonopoulos', 'jonas@hotmail.com', '234-0', 'Benji', 'JonaPass'),
('Sigrun Sigrunide', 'sigrun@gmail.is', '345-0', 'Orso', 'SiguPass'),
('Ahmad Ahmadides', 'ahmad@nackademin.se', '456-0', 'Rejvkavith', 'AhmaPass'),
('Dimitra Shostakovich', 'dimitri@google.rl', '567-0', 'Devilburg', 'DimiPass');


insert into Orders (CustomerID, OrderDate, PaymentStatus) values
(1, '2025-03-23', false),
(2, '2025-03-23', false),
(5, '2025-05-10', false),
(3, '2025-08-18', false),
(1, '2026-01-01', false),
(2, '2026-01-01', false),
(4, '2026-02-02', false);

insert into OrderedItems (OrderID, ProductID, ItemQuantity) values
(1, 1, 2),
(1, 2, 7),
(2, 2, 8),
(3, 5, 3),
(4, 7, 4),
(4, 1, 5),
(5, 3, 3),
(6, 8, 2),
(7, 4, 2),
(7, 6, 3);

insert into Stock (ProductID, StockQuantity) values
(1, 70), (2, 30), (3, 15), (4, 5),
(5, 100), (6, 34), (7, 20), (8, 6);