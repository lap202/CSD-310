 -- DROP DATABASE IF EXISTS OutlandAdventures;
 -- CREATE DATABASE OutlandAdventures;

-- USE OutlandAdventures;
-- drop database user if exists
-- DROP USER IF EXISTS 'OutlandAdventures_user'@'localhost';

-- create movies_user and grant them all privileges to the movies database
-- CREATE USER 'OutlandAdventures_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Explore';

-- grant all privileges to the movies database to user movies_user on localhost
-- GRANT ALL PRIVILEGES ON OutlandAdventures.* TO 'OutlandAdventures_user'@'localhost';

SET foreign_key_checks = 0;

-- Drop tables if they exist
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS airfare;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS marketing;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS guide;
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS tripEquipment;
DROP TABLE IF EXISTS equipmentOrders;

-- Destination table
CREATE TABLE Destination (
    destination_id INT AUTO_INCREMENT NOT NULL,
    destination_name VARCHAR(64) NOT NULL,
    destination_description VARCHAR(64),
    destination_country VARCHAR(20) NOT NULL,
    PRIMARY KEY (destination_id)
);

-- Airfare table
CREATE TABLE Airfare (
    airfare_id INT AUTO_INCREMENT NOT NULL,
    trip_id INT UNIQUE NOT NULL,
    airfare_price DECIMAL(10, 2) NOT NULL,
    airfare_quantity INT NOT NULL,
    airfare_description VARCHAR(64) NOT NULL,
    airfare_flight_number VARCHAR(64) NOT NULL,
    guide_id INT NOT NULL,
    PRIMARY KEY (airfare_id)
);

-- Trip table
CREATE TABLE trip (
    trip_id INT AUTO_INCREMENT NOT NULL,
    trip_name VARCHAR(64) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    trip_category VARCHAR(24) NOT NULL,
    destination_id INT NOT NULL,
    PRIMARY KEY(trip_id)
);

-- TripEquipment table
CREATE TABLE tripEquipment (
    tripEquipment_id INT AUTO_INCREMENT NOT NULL,
    equipment_id INT,
    trip_id INT NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY(tripEquipment_id)
);

-- Registration table
CREATE TABLE Registration (
    registration_id INT AUTO_INCREMENT NOT NULL,
    trip_id INT NOT NULL,
    registration_date DATE NOT NULL,
    customer_id INT NOT NULL,
    marketing_campaign varchar(64),
    PRIMARY KEY(registration_id)
);
-- Customer table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT NOT NULL,
    customer_fname VARCHAR(64) NOT NULL,
    customer_lname VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL,
    PRIMARY KEY(customer_id)
);

-- Employee table
CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT NOT NULL,
    employee_fname VARCHAR(64) NOT NULL,
    employee_lname VARCHAR(64) NOT NULL,
    employee_nickname VARCHAR(64),
    position VARCHAR(64) NOT NULL,
    PRIMARY KEY(employee_id)

);

-- Guide table
CREATE TABLE Guide (
    guide_id INT AUTO_INCREMENT NOT NULL,
    trip_id INT NOT NULL,
    employee_id INT NOT NULL,
    PRIMARY KEY(guide_id)
);

-- Marketing table
CREATE TABLE Marketing (
    marketing_id INT AUTO_INCREMENT NOT NULL,
    marketing_strategy VARCHAR(64) NOT NULL,
    marketing_budget DECIMAL(10, 2) NOT NULL,
    marketing_campaign VARCHAR(255) NOT NULL,
    PRIMARY KEY(marketing_id)
);

-- Equipment table
CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT NOT NULL,
    equipment_price decimal(10,2) not null,
    equipment_sales decimal(10,2) not null,
    equipment_name VARCHAR(64) NOT NULL,
    equipment_quantity INT NOT NULL,
    equipment_status VARCHAR(20) NOT NULL,
    equipment_ordered_date DATE NOT NULL,
    equipment_received_date DATE,
    PRIMARY KEY(equipment_id)
);


-- Rental table
CREATE TABLE Rental (
    rental_id INT AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL,
    equipment_id INT UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY(rental_id)
);

-- Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    marketing_id int,
    PRIMARY KEY(order_id)
);

-- equipmentOrders table
CREATE TABLE equipmentOrders (
    equipmentOrder_id INT AUTO_INCREMENT NOT NULL,
    order_id INT NOT NULL,
    equipment_id INT NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY(equipmentOrder_id)
);

#Customer Table Data:
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Inez","Zeigler","inez.zeigler@yahoo.com");
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Essie","Swaim","eSwaim@aol.com");
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Joshua","Willis","Willisj203@yahoo.com");
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Katherine","Williams","Kat.williams@icloud.com");
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Patrick","Yund","patrick_yund7@gmail.com");
INSERT INTO Customer(customer_fname, customer_lname, email)
    VALUES("Stanley","Zimmerman","Stan-z-man@outlook.com");


#Employee Table Data:
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("Blythe", "Timmerson", NULL, "Owner" );
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("Jim", "Ford", NULL, "Owner");
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("John", "MacNell", "Mac", "Guide" );
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("D.B.", "Marland", "Duke", "Guide" );
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("Anita", "Gallegos", NULL, "Marketing" );
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("Dimitrios", "Stravopolous", NULL, "Administative" );
INSERT INTO Employee(employee_fname, employee_lname, employee_nickname, position)
    VALUES("Mei", "Wong", NULL, "Web Developer" );



#Destination Table Data:
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Spituk Gompa","An Iconic Hilltop Monastery", "Asia");
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Dubai Desert Safari","Exciting Desert Adventures","Africa");
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Nandi Hills","An ancient hill fortress scattered with monuments and shrines.","Southern Europe");
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Grand Canyon","The Grand Canyon of the Colorado River ", "Asia");
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Iceland Blue Lagoon","The world''s largest geothermal pool", "Southern Europe");
INSERT INTO DESTINATION(destination_name, destination_description, destination_country)
    VALUES("Cinque Terre","Hike along the cliffside trail through 5 coastal villages.", "Asia");


#Equipment Table Data:
INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Outdoor Hiking Backpack", 45.00, 940.00,  12, "Rental", ('2020-08-23'), ('2020-08-25'));

INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Trekking Poles", 39.99, 1503.30, 10, "Purchase", ('2020-03-19'), ('2020-03-21'));

INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Trekking Poles", 39.99, 399.90, 10, "Rental", ('2020-03-19'), ('2020-03-21'));

INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Tent", 248.39, 3725.85, 15, "Purchase", ('2021-01-10'), ('2021-01-12'));

INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Camping Survival Kit", 45.87, 688.05, 23, "Rental", ('2022-04-27'), ('2022-04-29'));
INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Cooler", 179.99, 2159.88, 10, "Purchase", ('2022-10-10'), ('2022-10-12'));

INSERT INTO Equipment(equipment_name, equipment_price, equipment_sales, equipment_quantity, equipment_status, equipment_ordered_date, equipment_received_date)
    VALUES("Hammock", 39.99, 919.77, 23, "Rental", ('2022-01-14'), ('2022-01-16'));


#Marketing Table Data:
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Social Media", 500, "FBPROMOHIKE23");
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Email", 3000, "READY2HIKE");
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Website", 8000, "Welcome2023");
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Paid Advertising", 1000, "ExploreNow23");
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Customer Referral Program", 500, "2023Friends");
INSERT INTO Marketing(marketing_strategy, marketing_budget, marketing_campaign)
    VALUES("Partnerships", 1500, "JOINUS2023");




#Registration Table Data:
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(1, ('2022-08-23'), 2, 'JOINUS2023');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(3,('2022-03-19'), 1, 'ExploreNow23');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(2,('2021-01-10'), 4, '2023Friends');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(5,('2023-04-27'), 3, 'ExploreNow23');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(4, ('2023-10-10'), 6, 'Welcome2023');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(6,('2023-01-14'), 5, 'FBPROMOHIKE23');
INSERT INTO Registration(trip_id, registration_date, customer_id, marketing_campaign)
    VALUES(1, ('2020-08-23'), 2, 'READY2HIKE');


#Trip Table Data:
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Onward Climb Guide", ('2023-01-01'), ('2023-01-16'),"Hiking", 3);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Bucketlist Campers Guide", ('2021-03-23'),('2021-04-02'), "Camping", 2);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Tent & Trails Guide",('2022-06-12'), ('2022-06-12'),"Camping",1);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Outdoor Odyssey Guide",('2024-04-07'),('2022-04-15'),"Hiking",4);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("TrekTopia Tour Guide",('2023-12-01'),('2023-12-07'),"Hiking",6);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Camp The Woods",('2024-06-17'),('2024-06-29'),"Camping",5);
INSERT INTO trip(trip_name, start_date, end_date, trip_category, destination_id)
    VALUES("Onward Climb Guide",('2025-01-01'),('2025-01-16'),"Hiking",3);


#Guide Table Data:
INSERT INTO Guide(trip_id, employee_id)
    VALUES(3, 3);
INSERT INTO Guide(trip_id, employee_id)    
    VALUES(2, 3);


#Rental Table Data:
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(1, 1, ('2022-08-23'), ('2022-08-25'));
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(2, 2, ('2022-03-19'), ('2022-03-21'));
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(3, 3, ('2021-01-10'), ('2021-01-12'));
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(4, 4, ('2023-04-27'), ('2023-04-29'));
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(5, 5, ('2023-10-10'), ('2023-10-12'));
INSERT INTO Rental(customer_id, equipment_id, start_date, end_date)
    VALUES(6, 6, ('2023-01-14'), ('2023-01-16'));


#Airfare Table Data:
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(1, 500.00, 10, "Roundtrip Flight", "AA 123",1 );
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(2, 300.00, 10, "Roundtrip Flight", "AA 456", 2);
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(3, 200.00, 10, "Roundtrip Flight", "AA 789",1);
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(4, 400.00, 10, "Roundtrip Flight", "AA 101",1 );
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(5, 600.00, 10, "Roundtrip Flight", "AA 112", 2);
INSERT INTO Airfare(trip_id, airfare_price, airfare_quantity, airfare_description, airfare_flight_number, guide_id)
    VALUES(6, 700.00, 10, "Roundtrip Flight", "AA 131", 1);

#Orders Table Data:
INSERT INTO Orders(customer_id, order_date)
    VALUES(1, ('2022-08-23'));
INSERT INTO Orders(customer_id, order_date)
    VALUES(2, ('2022-03-19'));
INSERT INTO Orders(customer_id, order_date)
    VALUES(3, ('2021-01-10'));
INSERT INTO Orders(customer_id, order_date)
    VALUES(4, ('2023-04-27'));
INSERT INTO Orders(customer_id, order_date)
    VALUES(5, ('2023-10-10'));
INSERT INTO Orders(customer_id, order_date)
    VALUES(6, ('2023-01-14'));


ALTER TABLE Registration ADD FOREIGN KEY (trip_id) REFERENCES trip(trip_id);
ALTER TABLE Registration ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Guide ADD FOREIGN KEY (employee_id) REFERENCES Employee(employee_id);
ALTER TABLE rental ADD FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id);
ALTER TABLE rental ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE trip ADD FOREIGN KEY (destination_id) REFERENCES Destination(destination_id);
ALTER TABLE Airfare ADD FOREIGN KEY (trip_id) REFERENCES trip(trip_id);
ALTER TABLE Orders ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Rental ADD FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id);

SET foreign_key_checks = 1;

select * from rental r join Equipment E on r.equipment_id = E.equipment_id