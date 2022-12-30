CREATE DATABASE salary_db
CREATE TABLE salary
(
	name VARCHAR(20),
	salary INT
)

INSERT INTO salary
VALUES
('john', 10000),
('smith', 8000),
('kane', 5000),
('alex', 8000),
('den', 3000)

SELECT * FROM salary

SELECT TOP 1 salary FROM salary
where salary < (SELECT max(salary) from salary)
order by salary desc