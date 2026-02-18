use ShoeShop;

select distinct Customers.name as CustomerName 
from OrderedItems
inner join Orders on OrderedItems.OrderID = Orders.ID
inner join Customers on Orders.CustomerID = Customers.ID 
inner join Products on OrderedItems.ProductID = Products.ID 
inner join ShoeVariants on Products.ShoeVariantID = ShoeVariants.ID
inner join Models on Products.ModelID = Models.ID
inner join Brands on Models.BrandID = Brands.ID
inner join BelongTo on Models.ID = BelongTo.ModelID
inner join Categories on BelongTo.CategoryID = Categories.ID
where ShoeVariants.color = 'Yellow' 
    and Models.name = 'Aero'
    and Categories.name = 'Boots'
    and ShoeVariants.size = 40 
    and Brands.name = 'Dr.Manos';


select 
    Categories.name as ShoeCategory, 
    count(Products.ID) as Amount 
from Categories
inner join BelongTo on Categories.ID = BelongTo.CategoryID
inner join Models on BelongTo.ModelID = Models.ID
inner join Products on Models.ID = Products.ModelID
group by Categories.name;


select 
    Customers.name as 'Customer Name', 
    sum(OrderedItems.ItemQuantity * Products.price) as 'Has shopped for'
from Customers
inner join Orders on Customers.ID = Orders.CustomerID
inner join OrderedItems on Orders.ID = OrderedItems.OrderID
inner join Products on OrderedItems.ProductID = Products.ID
group by Customers.name;


select 
    Customers.city as 'Customers from', 
    sum(OrderedItems.ItemQuantity * Products.price) as 'Consumed for'
from Customers
inner join Orders on Customers.ID = Orders.CustomerID
inner join OrderedItems on Orders.ID = OrderedItems.OrderID
inner join Products on OrderedItems.ProductID = Products.ID
group by Customers.city
having sum(OrderedItems.ItemQuantity * Products.price) > 15000;


select 
    Brands.name as Brand, 
    Models.name as Model,
    sum(OrderedItems.ItemQuantity) as Sold
from Orders
inner join OrderedItems on Orders.ID = OrderedItems.OrderID
inner join Products on OrderedItems.ProductID = Products.ID
inner join Models on Products.ModelID = Models.ID
inner join Brands on Models.BrandID = Brands.ID
group by Brands.name, Models.name
order by Sold desc
limit 5
;

select
    month(Orders.OrderDate) as Best_Selling_Month,
    year(Orders.OrderDate) as Year,
    sum(OrderedItems.ItemQuantity * Products.Price) as Sold_for
from Orders
inner join OrderedItems on Orders.ID = OrderedItems.OrderID
inner join Products on OrderedItems.ProductID = Products.ID
group by Orders.OrderDate
order by Sold_for desc
limit 1
;

-- Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn. Använd
-- inga hårdkodade id-nummer i din fråga.
-- • Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet
-- produkter.
-- • Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens
-- för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas.
-- • Skriv ut en lista på det totala beställningsvärdet per ort där beställningsvärdet är större än
-- 1000 kr. Ortnamn och värde ska visas. (det måste finnas orter i databasen där det har
-- handlats för mindre än 1000 kr för att visa att frågan är korrekt formulerad)
-- • Skapa en topp-5 lista av de mest sålda produkterna.
-- • Vilken månad hade du den största försäljningen? (det måste finnas data som anger
-- försäljning för mer än en månad i databasen för att visa att frågan är korrekt formulerad)