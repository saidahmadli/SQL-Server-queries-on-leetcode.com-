/* 
177. Nth Highest Salary

Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null. */


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
      SELECT
 		DISTINCT E.Salary
 	FROM Employee E
 	WHERE
 	      @N = ( SELECT COUNT(DISTINCT Salary) FROM Employee E2
			WHERE
 	                 E.Salary <= E2.Salary
 			) 
     );
END