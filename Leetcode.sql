1757. Recyclable and Low Fat Products
SELECT product_id FROM Products WHERE low_fats='Y' AND recyclable='Y';

584. Find Customer Referee
SELECT name FROM Customer WHERE referee_id <> 2 OR referee_id IS NULL;

595. Big Countries
SELECT name, population, area FROM World WHERE area >= 3000000 OR population >= 25000000;

1148. Article Views I
SELECT DISTINCT author_id AS id FROM Views WHERE author_id = viewer_id ORDER BY id;

1683. Invalid Tweets
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15;

1378. Replace Employee ID With The Unique Identifier
SELECT eu.unique_id, e.name FROM Employees e LEFT JOIN EmployeeUNI eu ON e.id = eu.id;

1068. Product Sales Analysis I
SELECT p.product_name, s.year, s.price FROM Sales s INNER JOIN Product p ON s.product_id = p.product_id;

1581. Customer Who Visited but Did Not Make Any Transactions
SELECT customer_id, COUNT(*) AS count_no_trans FROM Visits WHERE visit_id NOT IN (SELECT visit_id FROM Transactions) GROUP BY customer_id;

197. Rising Temperature
SELECT id FROM (SELECT id, recordDate, temperature, LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date, LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp FROM Weather) w WHERE temperature > prev_temp AND DATEDIFF(recordDate, prev_date) = 1;

1661. Average Time of Process per Machine
SELECT machine_id, ROUND(AVG(processing_time),3) AS processing_time FROM (SELECT a.machine_id, a.process_id, ROUND(b.timestamp-a.timestamp,3) AS processing_time FROM Activity a JOIN Activity b ON a.machine_id=b.machine_id AND a.process_id=b.process_id WHERE a.activity_type='start' AND b.activity_type='end') t GROUP BY machine_id;

577. Employee Bonus
SELECT e.name, b.bonus FROM Employee e LEFT JOIN Bonus b ON e.empId=b.empId WHERE b.bonus < 1000 OR b.bonus IS NULL;

1280. Students and Examinations
SELECT p.student_id, s.student_name, p.subject_name, p.number AS attended_exams FROM (SELECT * FROM (SELECT student_id, subject_name, COUNT(*) AS number FROM Examinations GROUP BY student_id, subject_name UNION SELECT st.student_id, su.subject_name, 0 FROM Students st CROSS JOIN Subjects su) t GROUP BY student_id, subject_name) p LEFT JOIN Students s ON s.student_id=p.student_id ORDER BY p.student_id, p.subject_name;

570. Managers with at Least 5 Direct Reports
SELECT name FROM Employee WHERE id IN (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(*) >= 5);

1934. Confirmation Rate
SELECT s.user_id, ROUND(COUNT(CASE WHEN action='confirmed' THEN 1 END)/COUNT(*),2) AS confirmation_rate FROM Signups s LEFT JOIN Confirmations c ON s.user_id=c.user_id GROUP BY s.user_id;
