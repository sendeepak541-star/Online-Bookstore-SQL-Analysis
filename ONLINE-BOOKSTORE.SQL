-- CREATE DATABASE ONLINEBOOKSTORE;
-- USE ONLINEBOOKSTORE

-- CREATE TABLE BOOK(
-- Book_ID	INT PRIMARY KEY IDENTITY(1,1),
-- Title	VARCHAR(50),
-- Author	VARCHAR(50),
-- Genre	VARCHAR(50),
-- Published_Year	DATE,
-- Price	DECIMAL(12,0),
-- Stock	INT
-- )


-- DROP TABLE BOOK;

-- SELECT * FROM book;

----- NOW WE CREATED ORDERS TABLE

-- SELECT * FROM ORDERS;

--- NOW WE HAVE TO CREATE A  CUSTOMER_ID

-- SELECT * FROM CUSTOMERS;

-- now i have foreign key relation in order table through customer_id from customer table and book_id from books.

-- ALTER TABLE orders
-- ADD CONSTRAINT fk_orders_book
-- FOREIGN KEY (book_id)
-- REFERENCES books(book_id);

-- ALTER TABLE orders
-- ADD CONSTRAINT fk_orders_customer
-- FOREIGN KEY (customer_id)
-- REFERENCES customers(customer_id);

-- Q-1--retrieve  all books  in the 'fiction' genre?
 
--  SELECT * FROM BOOK WHERE GENRE='FICTION';

--Q-2- Find books published after the year 1950;

    -- SELECT * from book where published_year>1950;

--Q-3- list all customer from canada;

--  SELECT * from customers WHERE country = 'Canada';

--Q-4- Show orders placed in November 2023?

--   SELECT * from orders where order_date BETWEEN '2023-11-01' AND '2023-11-30';


-- Q-5--retrieve the total stocks of books availabe?

--   SELECT SUM(stock) as Total_stock  from books;

-- Q-6-- find the details of most expensive book?

--   SELECT * from books ORDER BY price desc;

-- SELECT
--     Book_ID,
--     Title,
--     ROUND(Price, 2) AS Price
-- FROM books;

-- ALTER TABLE books
-- ALTER COLUMN Price DECIMAL(10,2);

-- --Q--7 Show all customers who ordered more than one qty of a book?

--  SELECT * from orders where Quantity >1;

--  ALTER TABLE orders
-- ALTER COLUMN Total_Amount DECIMAL(10,1);

--Q-8-- list all geners availabe in the books;

-- SELECT genre from books;
--  SELECT  distinct genre from books;

--Q--10-- find the books with the lowest stocks?

-- SELECT * from books ORDER BY stock;

--Q--11-- Calculate the total revenue generated from all orders?

-- SELECT SUM(Quantity*total_amount) AS Total_revenue from orders;

--Advance Question

--Q--12 Retrieve the total number of books sold for each genre;

-- SELECT * from orders;
-- SELECT * from books;

-- USE ONLINEBOOKSTORE

-- SELECT b.genre, SUM(o.Quantity) AS total_book_sold from orders o join  books b ON o.book_id = b.book_id GROUP BY b.Genre;

--Q--13 find the Average price of books in the "Fantasy" Genre?

-- SELECT AVG(price) AS Averagebooks from books WHERE Genre='Fantasy';

--Q--14 list customers who have placed atleast 2 orders?

--  SELECT customer_id, COUNT(order_id) as order_count from orders GROUP BY Customer_ID HAVING COUNT(Order_ID)>=2;

--Q--15 Find the most frequently ordered id book sold?

-- SELECT book_id, COUNT(order_id) AS frequently_order from orders GROUP BY Book_ID ORDER BY frequently_order DESC;

--Q--16 Retrieve the total quantity of books sold by each author?

--author from books/ quantity from orders/ stock from books

-- SELECT B.author, SUM(o.quantity) AS Total_book_sold_by_author FROM orders o JOIN Book B on O.Book_ID = B.Book_ID GROUP BY Author ORDER BY Total_book_sold_by_author DESC;

-- Q-17 List the cities where customers spend on books more than $30 dollars?

-- total amount from orders /city from  customers/

-- USE ONLINEBOOKSTORE;

-- SELECT DISTINCT C.city, total_amount FROM Orders o JOIN CUSTOMERS c  ON o.Customer_ID=c.Customer_ID WHERE O.Total_Amount>30;

-- SELECT
--     c.City,
--     SUM(o.Total_Amount) AS Total_Spent
-- FROM Orders o
-- JOIN Customers c
-- ON o.Customer_ID = c.Customer_ID
-- GROUP BY c.City
-- HAVING SUM(o.Total_Amount) > 30;

--Q--18 Find the customer who spend most on orders?
--   SELECT top 5 C.customer_id, c.name, SUM(O.total_amount) As Total_spent2 from Orders o 
--   JOIN Customers c on o.customer_id = c.Customer_ID GROUP BY c.Customer_ID, c.name order by Total_spent2 DESC;
 ----------------------the end ------------------------------








