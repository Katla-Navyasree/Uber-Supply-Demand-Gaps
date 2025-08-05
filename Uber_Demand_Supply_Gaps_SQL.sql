CREATE DATABASE uber_project;
USE uber_project;

CREATE TABLE uber_data (
    request_id INT,
    pickup_point VARCHAR(50),
    driver_id INT,
    status VARCHAR(50),
    request_timestamp DATETIME,
    drop_timestamp DATETIME,
    request_date DATE,
    request_hour INT,
    drop_date DATE,
    drop_hour INT
);

# 1. Total Number of Requests
SELECT COUNT(*) AS total_requests FROM uber_data;

#2. Request Count by Pickup Point
SELECT pickup_point, COUNT(*) AS total_requests
FROM uber_data
GROUP BY pickup_point;

#3. Request Status Breakdown
SELECT status, COUNT(*) AS total
FROM uber_data
GROUP BY status;

#4. Trips That Were Cancelled
SELECT * FROM uber_data
WHERE status = 'Cancelled';

#5. Gap Analysis (When Cabs Were Not Available)
SELECT pickup_point, COUNT(*) AS no_cab_requests
FROM uber_data
WHERE status = 'No Cars Available'
GROUP BY pickup_point;
