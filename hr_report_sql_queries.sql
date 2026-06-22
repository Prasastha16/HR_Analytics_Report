create database hr;
use hr;
create table employee;

-- Q1. Find the total number of employees in the dataset.
select count(EmpID) from employee;

-- Q2. How many employees have left the company (Attrition = 'Yes')?
select count(Attrition) from employee
where Attrition='Yes';

-- Q3. Count the number of employees in each department.
select count(*) as employee_count from employee
group by department;

-- Q4. Find the average age of employees.
select avg(Age) from employee;

-- Q5. List all employees who work overtime (OverTime = 'Yes').
select * from employee
where OverTime = 'Yes';

-- Q6. Find the attrition rate department-wise.
SELECT Department,
       ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
           * 100.0 / COUNT(*),
           2) AS Attrition_Rate
FROM employee
GROUP BY Department;

-- Q7. Calculate the average monthly income for each job role.
select avg(MonthlyIncome) as monthly_income from employee
group by JobRole;

-- Q8. Find the top 5 highest-paid employees.
select * from employee
order by MonthlyIncome desc
limit 5;

-- Q9. Which education field has the highest number of employees?
select EducationField, COUNT(*) AS Employee_Count
FROM employee
GROUP BY EducationField
ORDER BY Employee_Count DESC
LIMIT 1;

-- Q10. Find the average work-life balance score for employees who left the company.
select avg(WorkLifeBalance) from employee
where Attrition='Yes';

-- Q11. Which job role has the highest attrition count?
SELECT JobRole, COUNT(*) AS Attrition_Count FROM employee
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC
LIMIT 1;

-- Q12. Compare average monthly income between employees who stayed and those who left.
SELECT Attrition, AVG(MonthlyIncome) AS Avg_Income FROM employee
GROUP BY Attrition;

-- Q13. Does overtime appear to affect attrition? Show attrition counts by overtime status.
SELECT OverTime, Attrition, COUNT(*) AS Employee_Count FROM employee
GROUP BY OverTime, Attrition;

-- Q14. Find the average years at company for employees who left vs stayed.
SELECT Attrition, AVG(YearsAtCompany) AS Avg_Years FROM employee
GROUP BY Attrition;

-- Q15. Which age group has the highest attrition rate?
SELECT AgeGroup, COUNT(*) AS Attrition_Count FROM employee
WHERE Attrition='Yes'
GROUP BY AgeGroup
ORDER BY Attrition_Count DESC
LIMIT 1;
