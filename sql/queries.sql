-- =========================================
-- SQL Practice Queries
-- Platform: SQL Academy (https://sql-academy.org/ru/trainer)
-- Author: Elvin Abbaszade
-- Solved: 56 tasks
-- =========================================

-- ========== EASY ==========

-- Task 1: Get names of all people (https://sql-academy.org/en/trainer/tasks/1)
SELECT name 
FROM People;

-- Task 2: Names of all airlines (https://sql-academy.org/en/trainer/tasks/2)
SELECT Company.name 
FROM Company;

-- Task 3: Flights from Moscow (https://sql-academy.org/en/trainer/tasks/3)
SELECT *
FROM Trip
WHERE town_from = 'Moscow';

-- Task 4: Names ending with "man" (https://sql-academy.org/en/trainer/tasks/4)
SELECT Passenger.name
FROM Passenger 
WHERE Passenger.name LIKE '%man';

-- Task 5: Count flights on TU-134 (https://sql-academy.org/en/trainer/tasks/5)
SELECT COUNT(*) AS count
FROM Trip
WHERE Trip.plane = 'TU-134';

-- ========== MEDIUM ==========

-- Task 8: Flights from Paris (https://sql-academy.org/en/trainer/tasks/8)
SELECT 
    Trip.town_to, 
    TIMEDIFF(Trip.time_in, Trip.time_out) AS flight_time
FROM Trip
WHERE Trip.town_from = 'Paris';

-- Task 11: Passengers with the longest name (https://sql-academy.org/en/trainer/tasks/11)
SELECT name
FROM Passenger
WHERE LENGTH(name) = (
    SELECT MAX(LENGTH(name))
    FROM Passenger
);

-- Task 13: Full namesakes (https://sql-academy.org/en/trainer/tasks/13)
SELECT Passenger.name AS name
FROM Passenger
GROUP BY Passenger.name
HAVING COUNT(Passenger.name) > 1;

-- Task 16: Passengers by number of flights (https://sql-academy.org/en/trainer/tasks/16)
SELECT Passenger.id, Passenger.name, COUNT(Pass_in_trip.trip) AS count
FROM Passenger
JOIN Pass_in_trip ON Passenger.id = Pass_in_trip.passenger
GROUP BY Pass_in_trip.passenger
ORDER BY count DESC, Passenger.name ASC;

-- Task 24: Who spent how much in June 2005 (https://sql-academy.org/en/trainer/tasks/24)
SELECT member_name, SUM(amount * unit_price) AS costs
FROM FamilyMembers
JOIN Payments ON FamilyMembers.member_id = Payments.family_member
WHERE YEAR(date) = 2005 AND MONTH(date) = 6
GROUP BY member_name

-- Task 67: Departure and arrival time (https://sql-academy.org/en/trainer/tasks/67)
SELECT CONCAT(
    DATE_FORMAT(time_out, '%H:%i, %e.%c'),
    ' - ',
    DATE_FORMAT(time_in, '%H:%i, %e.%c')
) AS flight_time
FROM Trip;

-- ========== HARD ==========

-- Task 44: Maximum age in 10th grades (https://sql-academy.org/en/trainer/tasks/44)
SELECT MAX(YEAR(NOW()) - YEAR(birthday)) AS max_year
FROM Student
JOIN Student_in_class ON Student.id = Student_in_class.student
JOIN Class ON Student_in_class.class = Class.id
WHERE Class.name LIKE '10%';
