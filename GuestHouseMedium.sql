--Guest House Medium
--6
SELECT SUM(nights*amount)
FROM booking
JOIN rate
ON booking.room_type_requested=rate.room_type AND booking.occupants=rate.occupancy
WHERE booking.guest_id=
(SELECT id
FROM guest
WHERE first_name='Ruth' AND last_name='Cadbury')
--7
--8
SELECT
	last_name,
	first_name,
	address,
	CASE
		WHEN
			SUM(nights) IS NULL
		THEN
			0
		ELSE
			SUM(nights)
	END
	AS nights
FROM
	booking
	RIGHT JOIN
		guest
		ON (guest.id = booking.guest_id)
WHERE
	guest.address LIKE '%Edinburgh%'
GROUP BY
	guest.last_name, guest.first_name, guest.address
ORDER BY
	guest.last_name, guest.first_name
--9
SELECT
	booking_date AS i,
	COUNT(booking_id) AS arrivals
FROM
	booking
WHERE
	booking_date BETWEEN '2016-11-25' AND '2016-12-01'
GROUP BY
	booking_date

--10