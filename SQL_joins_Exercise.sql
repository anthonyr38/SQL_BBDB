/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS Product_Name, categories.Name AS Category_Name
FROM products
INNER JOIN categories on products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1 AND categories.CategoryID = 1;
	

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS Product_Name, p.Price, reviews.Rating
FROM products AS p
INNER JOIN reviews ON reviews.ProductID = p.ProductID
WHERE reviews.Rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity) AS Total_Qty
FROM sales as s
INNER JOIN employees AS e 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total_Qty DESC;


SELECT e.FirstName, e.MiddleInitial, e.LastName, SUM(s.Quantity * s.PricePerUnit) AS Total_Sold
FROM sales as s
INNER JOIN employees AS e 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total_Sold DESC;



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.NAME as 'Dept. Name', c.Name as 'Cat.Name'
FROM departments AS d
INNER JOIN categories AS c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';




/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 /*
 SELECT * FROM products
 WHERE Name LIKE '%Eagles%'
 */
 
 SELECT p.NAME, SUM(s.Quantity) AS 'TOTAL SOLD',p.Price, SUM(s.Quantity * s.PricePerUnit) AS 'TOTAL SALES'
 FROM products AS p
 INNER JOIN sales AS s
 ON s.ProductID = p.ProductID
 WHERE p.ProductID = 97;  
 
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

/*
 SELECT * FROM products
 WHERE Name LIKE '%Visio%'
 */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;




-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e. MiddleInitial, e.LastName, p.Name, SUM(s.Quantity) as Total_Qty
FROM sales AS s
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.LastName;



