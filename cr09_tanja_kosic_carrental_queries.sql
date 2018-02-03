-- ALTER TABLE add_charge DROP FOREIGN KEY fk_return_id; 
-- this 'thing' doesn't do what it's supposed to do.
-- I know that I have a mistake in last table 'add_charge',
-- but I don't have anymore time to recreate the whole database

SELECT * FROM customer WHERE last_name = 'Foster';


SELECT address, credit_card, last_name FROM customer WHERE first_name = 'Maria';


SELECT * FROM start_location WHERE pick_up < '2018-01-01 00:00:00';


SELECT reservation_id, fk_customer_id, fk_invoice_id
FROM reservation 
WHERE fk_invoice_id IN (SELECT invoice_id
                    FROM invoice
                    WHERE payment_status = 'cancelled');

SELECT fk_customer_id, fk_car_id, fk_return_id
FROM reservation 
WHERE fk_return_id IN (SELECT return_id
                      FROM return_location
                      WHERE tank = 'tank empty');

SELECT fk_customer_id, fk_car_id, fk_return_id
FROM reservation 
WHERE fk_return_id IN (SELECT add_charge_id
                      FROM add_charge
                      WHERE payment > '100');



 

