--Guest House Hands-On
--Easy
--1
SELECT booking_date,nights
FROM booking 
 WHERE guest_id=1183

 --2
SELECT booking.arrival_time,guest.first_name,guest.last_name
FROM guest JOIN booking
ON guest.id=booking.guest_id
WHERE booking.booking_date='2016-11-05'
ORDER BY booking.arrival_time

--3
SELECT booking.booking_id,booking.room_type_requested,
booking.occupants,rate.amount
FROM booking
JOIN rate
ON booking.booking_id IN (5152,5154,5295)
WHERE booking.occupants=rate.occupancy AND booking.room_type_requested=rate.room_type

--4
SELECT first_name,last_name,address
FROM guest
JOIN booking
ON guest.id=booking.guest_id
WHERE booking.room_no=101 AND booking.booking_date='2016-12-03'

--5
SELECT guest_id,count(nights) as 'COUNT(nights)',sum(nights) as 'SUM(nights)'
FROM booking
WHERE guest_id IN (1185,1270)
GROUP BY guest_id