create database event;

use event;


CREATE TABLE venues (
    venue_id INT PRIMARY KEY ,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO venues (venue_id, venue_name, location, capacity)
VALUES
(1, 'Grand Hall', 'Ahmedabad', 500),
(2, 'City Center', 'Surat', 300),
(3, 'Open Arena', 'Vadodara', 1000);



CREATE TABLE organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone_number VARCHAR(20)
);


INSERT INTO organizers
(organizer_id, organizer_name, contact_email, phone_number)
VALUES
(1, 'Rahul Shah', 'rahul@gmail.com', '9876543210'),
(2, 'Priya Patel', 'priya@gmail.com', '9876501234'),
(3, 'Amit Verma', 'amit@gmail.com', '9999999999');



CREATE TABLE events (
    event_id INT PRIMARY KEY ,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT,
    organizer_id INT,
    ticket_price DECIMAL(10,2),
    total_seats INT,
    available_seats INT,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id)
);

INSERT INTO events(event_id, event_name, event_date, venue_id, organizer_id,
ticket_price, total_seats, available_seats)
VALUES
(1, 'Tech Conference', '2026-12-15', 1, 1, 1500, 500, 120),
(2, 'Music Night', '2026-11-20', 2, 2, 1000, 300, 50),
(3, 'Startup Meetup', '2026-10-05', 3, 3, 800, 1000, 700),
(4, 'Business Expo', '2026-12-25', 1, 2, 2000, 500, 80);




CREATE TABLE attendees (
    attendee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);


INSERT INTO attendees
(name, email, phone_number)
VALUES
('Aryan', 'aryan@gmail.com', '8888888888'),
('Meet', 'meet@gmail.com', '7777777777'),
('Jay', NULL, '6666666666'),
('Neha', 'neha@gmail.com', '9999991111');


CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    attendee_id INT,
    booking_date DATE,
    status VARCHAR(20),
FOREIGN KEY (event_id) REFERENCES events(event_id),
FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id)
);

INSERT INTO tickets(event_id, attendee_id, booking_date, status)
VALUES
(1, 1, '2026-05-01', 'Confirmed'),
(1, 2, '2026-05-03', 'Pending'),
(2, 3, '2026-05-04', 'Cancelled'),
(3, 4, '2026-05-06', 'Confirmed');




CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_id INT,
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATETIME,

    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);


INSERT INTO payments(ticket_id, amount_paid, payment_status, payment_date)
VALUES
(1, 1500, 'Success', '2026-05-01 10:00:00'),
(2, 1000, 'Pending', '2026-05-03 11:00:00'),
(3, 0, 'Failed', '2026-05-04 09:30:00'),
(4, 800, 'Success', '2026-05-06 12:00:00');




INSERT INTO events(event_id, event_name, event_date, venue_id, organizer_id,
ticket_price, total_seats, available_seats)
VALUES
(5, 'Tech', '2026-12-15', 1, 1, 1500, 500, 120);




UPDATE events
SET ticket_price = 1800
WHERE event_id = 1;



DELETE FROM events
WHERE event_id = 4;


 

SELECT * FROM events
WHERE event_name LIKE '%Tech%';


# WHERE, HAVING, LIMIT


SELECT * FROM venues v INNER JOIN events e
ON v.venue_id = e.venue_id WHERE location = 'Ahmedabad';





SELECT e.event_name, SUM(p.amount_paid) AS total_revenue FROM events e
INNER JOIN tickets t ON e.event_id = t.event_id INNER JOIN payments p
ON t.ticket_id = p.ticket_id GROUP BY e.event_name
ORDER BY total_revenue DESC LIMIT 5;



SELECT * FROM tickets WHERE booking_date >= CURDATE() - INTERVAL 7 DAY;

SELECT * FROM events WHERE MONTH(event_date) = 12
AND available_seats > total_seats * 0.5;


SELECT DISTINCT a.name FROM attendees a LEFT JOIN tickets t
ON a.attendee_id = t.attendee_id LEFT JOIN payments p
ON t.ticket_id = p.ticket_id WHERE t.ticket_id IS NOT NULL
OR p.payment_status = 'Pending';



SELECT * FROM events
WHERE NOT available_seats = 0;



SELECT * FROM events
ORDER BY event_date ;



SELECT e.event_name, COUNT(t.attendee_id) AS total_attendees
FROM events e LEFT JOIN tickets t ON e.event_id = t.event_id
GROUP BY e.event_name;


SELECT e.event_name, SUM(p.amount_paid) AS revenue FROM events e
INNER JOIN tickets t ON e.event_id = t.event_id INNER JOIN payments p
ON t.ticket_id = p.ticket_id GROUP BY e.event_name;




SELECT SUM(amount_paid) AS total_revenue
FROM payments;



SELECT e.event_name, COUNT(t.attendee_id) AS attendee_count FROM events e
INNER JOIN tickets t ON e.event_id = t.event_id GROUP BY e.event_name
ORDER BY attendee_count DESC LIMIT 1;


SELECT AVG(ticket_price) AS average_price FROM events;




SELECT e.event_name, v.venue_name, v.location
FROM events e INNER JOIN venues v
ON e.venue_id = v.venue_id;


SELECT a.name, p.payment_status FROM attendees a
LEFT JOIN tickets t ON a.attendee_id = t.attendee_id
LEFT JOIN payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status != 'Success' OR p.payment_status IS NULL;


SELECT e.event_name, t.ticket_id FROM tickets t
RIGHT JOIN events e ON t.event_id = e.event_id
WHERE t.ticket_id IS NULL;



SELECT a.name, t.ticket_id FROM attendees a
LEFT JOIN tickets t ON a.attendee_id = t.attendee_id
UNION
SELECT a.name,t.ticket_id FROM attendees a
RIGHT JOIN tickets t ON a.attendee_id = t.attendee_id;


SELECT event_name FROM events WHERE event_id IN
(SELECT t.event_id FROM tickets t INNER JOIN payments p ON t.ticket_id = p.ticket_id
GROUP BY t.event_id HAVING SUM(p.amount_paid) >(SELECT AVG(amount_paid)
FROM payments));


SELECT attendee_id, COUNT(event_id) AS total_events FROM tickets
GROUP BY attendee_id HAVING COUNT(event_id) > 1;



SELECT organizer_name FROM organizers WHERE organizer_id IN
(SELECT organizer_id FROM events GROUP BY organizer_id
HAVING COUNT(event_id) > 3 );

SELECT event_name, MONTH(event_date) AS event_month FROM events;



SELECT event_name, DATEDIFF(event_date, CURDATE()) AS remaining_days
FROM events;

SELECT payment_id,
DATE_FORMAT(payment_date, '%Y-%m-%d %H:%i:%s') AS formatted_date
FROM payments;

SELECT UPPER(organizer_name) FROM organizers;


SELECT TRIM(name) FROM attendees;

SELECT name,ifNULL(email, 'Not Provided') AS email FROM attendees;

SELECT e.event_name, SUM(p.amount_paid) AS revenue,
RANK() OVER(ORDER BY SUM(p.amount_paid) DESC) AS ranking FROM events e
INNER JOIN tickets t ON e.event_id = t.event_id INNER JOIN payments p
ON t.ticket_id = p.ticket_id GROUP BY e.event_name;


SELECT payment_date, SUM(amount_paid)
OVER(ORDER BY payment_date) AS cumulative_sales FROM payments;

SELECT event_id, COUNT(attendee_id) OVER(ORDER BY event_id) AS running_total
FROM tickets;




SELECT event_name, available_seats,total_seats,
CASE
    WHEN available_seats < total_seats * 0.2 THEN 'High Demand'
    WHEN available_seats BETWEEN total_seats * 0.2 AND total_seats * 0.5 THEN 'Moderate Demand'
    ELSE 'Low Demand'
END AS demand_status
FROM events;

SELECT payment_id,payment_status,
CASE
    WHEN payment_status = 'Success' THEN 'Successful'
    WHEN payment_status = 'Failed' THEN 'Failed'
    ELSE 'Pending'
END AS payment_result FROM payments;