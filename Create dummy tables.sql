
/*

CREATE CAR RENTAL SCHEMA WITH THE FOLLOWING TABLES. 


1. Follow the steps in the video to create a schema in MySQL, there are other ways of doing this
2. Simple run this code.
3. Refrech the schemas section to view the tables.

*/

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`location` ;
CREATE TABLE IF NOT EXISTS carrental.`location` (
  `id` INT NOT NULL,
  `street_address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `zipcode` INT(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `zipcode_UNIQUE` (`zipcode` ASC));


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (1, '1001 Henderson St', 'Fort Worth', 'TX', 76102);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (2, '300 Reunion Blvd', 'Dallas', 'TX', 75207);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (3, '5911 Blair Rd NW', 'Washington', 'DC', 20011);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (4, '9217 Airport Blvd', 'Los Angeles', 'CA', 90045);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (5, '310 E 64th St', 'New York', 'NY', 10021);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (6, '1011 Pike St', 'Seattle', 'WA', 98101);
INSERT INTO carrental.`location` (`id`, `street_address`, `city`, `state`, `zipcode`) VALUES (7, '5150 W 55th St', 'Chicago', 'IL', 60638);
COMMIT;

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`customer` ;
CREATE TABLE IF NOT EXISTS carrental.`customer` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `driver_license_number` VARCHAR(12) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(12) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `driver_license_number_UNIQUE` (`driver_license_number` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));



-- -----------------------------------------------------
-- Data for table `customer`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`customer` (`id`, `first_name`, `last_name`, `dob`, `driver_license_number`, `email`, `phone`) VALUES (1, 'Kelby', 'Matterdace', '1974-05-22', 'V435899293', 'kmatterdace0@oracle.com', '181-441-7828');
INSERT INTO carrental.`customer` (`id`, `first_name`, `last_name`, `dob`, `driver_license_number`, `email`, `phone`) VALUES (2, 'Orion', 'De Hooge', '1992-08-07', 'Z140530509', 'odehooge1@quantcast.com', '948-294-5458');
INSERT INTO carrental.`customer` (`id`, `first_name`, `last_name`, `dob`, `driver_license_number`, `email`, `phone`) VALUES (3, 'Sheena', 'Macias', '1981-03-10', 'W045654959', 'smacias3@amazonaws.com', NULL);
INSERT INTO carrental.`customer` (`id`, `first_name`, `last_name`, `dob`, `driver_license_number`, `email`, `phone`) VALUES (4, 'Irving', 'Packe', '1994-12-19', 'O232196823', 'ipacke4@cbc.ca', '157-815-8064');
INSERT INTO carrental.`customer` (`id`, `first_name`, `last_name`, `dob`, `driver_license_number`, `email`, `phone`) VALUES (5, 'Kass', 'Humphris', '1993-12-16', 'G055017319', 'khumphris5@xrea.com', '510-624-4189');
COMMIT;

-- -----------------------------------------------------
-- Table `fuel_option`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`fuel_option` ;
CREATE TABLE IF NOT EXISTS carrental.`fuel_option` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Data for table `fuel_option`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`fuel_option` (`id`, `name`, `description`) VALUES (1, 'Pre-pay', 'Customer pays in advance for a full tank of fuel, so they can return back with an empty tank of fuel, without the hassle of last minute stops and purchasing the fuel.');
INSERT INTO carrental.`fuel_option` (`id`, `name`, `description`) VALUES (2, 'Self-Service', 'Customer will get full tank of fuel with the rental car and must return it back with the full tank of fuel.');
INSERT INTO carrental.`fuel_option` (`id`, `name`, `description`) VALUES (3, 'Market', 'Customer gets the car with full tank of fuel but pays for fuel at market price based on fuel usage.  ');
COMMIT;

-- -----------------------------------------------------
-- Table `insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`insurance` ;
CREATE TABLE IF NOT EXISTS carrental.`insurance` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `cost` DECIMAL(13,2)  NOT NULL,
  PRIMARY KEY (`id`));
  
-- -----------------------------------------------------
-- Data for table `insurance`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`insurance` (`id`, `name`, `cost`) VALUES (1, 'Cover The Car (LDW)', 30.99);
INSERT INTO carrental.`insurance` (`id`, `name`, `cost`) VALUES (2, 'Cover Myself (PAI)', 7.00);
INSERT INTO carrental.`insurance` (`id`, `name`, `cost`) VALUES (3, 'Cover My Belongings (PEP)', 2.95);
INSERT INTO carrental.`insurance` (`id`, `name`, `cost`) VALUES (4, 'Cover My Liability (ALI)', 16.50);


-- -----------------------------------------------------
-- Table `equipment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`equipment_type` ;
CREATE TABLE IF NOT EXISTS carrental.`equipment_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rental_value` DECIMAL(13,2) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Data for table `equipment_type`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`equipment_type` (`id`, `name`, `rental_value`) VALUES (1, 'GPS', 14.99);
INSERT INTO carrental.`equipment_type` (`id`, `name`, `rental_value`) VALUES (2, 'Satellite Radio', 7.99);
INSERT INTO carrental.`equipment_type` (`id`, `name`, `rental_value`) VALUES (3, 'Child Safety Seats', 13.99);
COMMIT;

-- -----------------------------------------------------
-- Table `equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`equipment` ;
CREATE TABLE IF NOT EXISTS carrental.`equipment` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `equipment_type_id` INT NOT NULL,
  `current_location_id` INT NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Data for table `equipment`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (1, 'Garmin GPS', 1, 5);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (2, 'Tomtom GPS', 1, 6);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (3, 'Tomtom GPS', 1, 7);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (4, 'Infant Child Seat', 3, 1);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (5, 'Child Seat', 3, 7);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (6, 'Booster Seat', 3, 1);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (7, 'Sirius XM Satellite Radio', 2, 5);
INSERT INTO carrental.`equipment` (`id`, `name`, `equipment_type_id`, `current_location_id`) VALUES (8, 'Sirius XM Satellite Radio', 2, 6);
COMMIT;

-- -----------------------------------------------------
-- Alter table for `equipment`
-- -----------------------------------------------------

ALTER TABLE carrental.`equipment`
ADD CONSTRAINT `fk_equipment_equipment_type`
    FOREIGN KEY (`equipment_type_id`)
    REFERENCES `equipment_type` (`id`)
    ON DELETE RESTRICT
	ON UPDATE CASCADE,
ADD CONSTRAINT `fk_equipment_location`
	FOREIGN KEY (`current_location_id`)
	REFERENCES `location` (`id`)
    ON DELETE RESTRICT
	ON UPDATE CASCADE;

-- -----------------------------------------------------
-- Table `vehicle_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`vehicle_type` ;
CREATE TABLE IF NOT EXISTS carrental.`vehicle_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `rental_value` DECIMAL(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


-- -----------------------------------------------------
-- Data for table `vehicle_type`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`vehicle_type` (`id`, `name`, `rental_value`) VALUES (1, 'Economy', 26.77);
INSERT INTO carrental.`vehicle_type` (`id`, `name`, `rental_value`) VALUES (2, 'Intermediate', 29.45);
INSERT INTO carrental.`vehicle_type` (`id`, `name`, `rental_value`) VALUES (3, 'Standard', 34.81);
INSERT INTO carrental.`vehicle_type` (`id`, `name`, `rental_value`) VALUES (4, 'Economy SUV', 37.48);
COMMIT;

-- -----------------------------------------------------
-- Table `vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`vehicle` ;
CREATE TABLE IF NOT EXISTS carrental.`vehicle` (
  `id` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `model_year` YEAR NOT NULL,
  `mileage` INT(9)  NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `vehicle_type_id` INT NOT NULL,
  `current_location_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
-- -----------------------------------------------------
-- Data for table `vehicle`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (1, 'Nissan', 'Versa', 2016, 65956, 'white', 1, 1);
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (2, 'Mitsubishi', 'Mirage', 2017, 55864, 'light blue', 1, 6);
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (3, 'Chevrolet', 'Cruze', 2017, 45796, 'dark gray', 2, 5);
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (4, 'Hyundai', 'Elantra', 2018, 35479, 'black', 2, 1);
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (5, 'Volkswagen', 'Jetta', 2019, 2032, 'light gray', 3, 3);
INSERT INTO carrental.`vehicle` (`id`, `brand`, `model`, `model_year`, `mileage`, `color`, `vehicle_type_id`, `current_location_id`) VALUES (6, 'Toyota', 'RAV4', 2018, 12566, 'white', 4, 7);
COMMIT;

-- -----------------------------------------------------
-- Alter table for `vehicle`
-- -----------------------------------------------------
ALTER TABLE carrental.`vehicle`
ADD CONSTRAINT `fk_vehicle_vehicle_type`
    FOREIGN KEY (`vehicle_type_id`)
    REFERENCES `vehicle_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
 ADD CONSTRAINT `fk_vehicle_current_location`
    FOREIGN KEY (`current_location_id`)
    REFERENCES `location` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- -----------------------------------------------------
-- Table `rental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`rental` ;
CREATE TABLE IF NOT EXISTS carrental.`rental` (
  `id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  `vehicle_type_id` INT NOT NULL,
  `fuel_option_id` INT NOT NULL,
  `pickup_location_id` INT NOT NULL,
  `drop_off_location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rental_customer_idx` (`customer_id` ASC),
  INDEX `fk_rental_fuel_option_idx` (`fuel_option_id` ASC),
  INDEX `fk_rental_pickup_location_idx` (`pickup_location_id` ASC),
  INDEX `fk_rental_dropoff_location_idx` (`drop_off_location_id` ASC),
  INDEX `fk_rental_vehicle_type_idx` (`vehicle_type_id` ASC),
  CONSTRAINT `fk_rental_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_fuel_option`
    FOREIGN KEY (`fuel_option_id`)
    REFERENCES `fuel_option` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_pickup_location`
    FOREIGN KEY (`pickup_location_id`)
    REFERENCES `location` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_dropoff_location`
    FOREIGN KEY (`drop_off_location_id`)
    REFERENCES `location` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_vehicle_type`
    FOREIGN KEY (`vehicle_type_id`)
    REFERENCES `vehicle_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table `rental`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`rental` (`id`, `start_date`, `end_date`, `customer_id`, `vehicle_type_id`, `fuel_option_id`, `pickup_location_id`, `drop_off_location_id`) VALUES (1, '2018-07-14', '2018-07-23', 1, 2, 1, 3, 5);
INSERT INTO carrental.`rental` (`id`, `start_date`, `end_date`, `customer_id`, `vehicle_type_id`, `fuel_option_id`, `pickup_location_id`, `drop_off_location_id`) VALUES (2, '2018-07-10', '2018-07-12', 2, 1, 2, 1, 2);
INSERT INTO carrental.`rental` (`id`, `start_date`, `end_date`, `customer_id`, `vehicle_type_id`, `fuel_option_id`, `pickup_location_id`, `drop_off_location_id`) VALUES (3, '2018-06-30', '2018-07-20', 3, 1, 3, 4, 6);
INSERT INTO carrental.`rental` (`id`, `start_date`, `end_date`, `customer_id`, `vehicle_type_id`, `fuel_option_id`, `pickup_location_id`, `drop_off_location_id`) VALUES (4, '2018-06-10', '2018-07-02', 4, 4, 2, 2, 7);
INSERT INTO carrental.`rental` (`id`, `start_date`, `end_date`, `customer_id`, `vehicle_type_id`, `fuel_option_id`, `pickup_location_id`, `drop_off_location_id`) VALUES (5, '2018-07-14', '2018-07-27', 5, 3, 3, 5, 3);
COMMIT;

-- -----------------------------------------------------
-- Table `rental_has_equipment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`rental_has_equipment_type` ;
CREATE TABLE IF NOT EXISTS carrental.`rental_has_equipment_type` (
  `rental_id` INT NOT NULL,
  `equipment_type_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `equipment_type_id`),
  INDEX `fk_rental_has_equipment_type_equipment_type_idx` (`equipment_type_id` ASC),
  INDEX `fk_rental_has_equipment_type_rental_idx` (`rental_id` ASC),
  CONSTRAINT `fk_rental_has_equipment_type_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `rental` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_has_equipment_type_equipment_type`
    FOREIGN KEY (`equipment_type_id`)
    REFERENCES `equipment_type` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table `rental_has_equipment_type`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (1, 1);
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (1, 2);
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (3, 1);
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (3, 2);
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (4, 1);
INSERT INTO carrental.`rental_has_equipment_type` (`rental_id`, `equipment_type_id`) VALUES (4, 3);
COMMIT;

-- -----------------------------------------------------
-- Table `rental_has_insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`rental_has_insurance` ;
CREATE TABLE IF NOT EXISTS carrental.`rental_has_insurance` (
  `rental_id` INT NOT NULL,
  `insurance_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `insurance_id`),
  INDEX `fk_rental_has_insurance_insurance_idx` (`insurance_id` ASC),
  INDEX `fk_rental_has_insurance_rental_idx` (`rental_id` ASC),
  CONSTRAINT `fk_rental_has_insurance_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `rental` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_has_insurance_insurance`
    FOREIGN KEY (`insurance_id`)
    REFERENCES `insurance` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table `rental_has_insurance`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (1, 1);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (1, 2);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (1, 3);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (2, 1);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (2, 4);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (3, 1);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (4, 1);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (4, 2);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (4, 3);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (4, 4);
INSERT INTO carrental.`rental_has_insurance` (`rental_id`, `insurance_id`) VALUES (5, 1);
COMMIT;

-- -----------------------------------------------------
-- Table `vehicle_has_equiment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`vehicle_has_equiment` ;
CREATE TABLE IF NOT EXISTS carrental.`vehicle_has_equiment` (
  `equipment_id` INT NOT NULL,
  `vehicle_id` INT NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`equipment_id`, `vehicle_id`),
  INDEX `fk_equipment_has_vehicle_vehicle_idx` (`vehicle_id` ASC),
  INDEX `fk_equipment_has_vehicle_equipment_idx` (`equipment_id` ASC),
  CONSTRAINT `fk_equipment_has_vehicle_equipment`
    FOREIGN KEY (`equipment_id`)
    REFERENCES `equipment` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_equipment_has_vehicle_vehicle`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `vehicle` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Data for table `vehicle_has_equiment`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (1, 3, '2018-07-14', '2018-07-23');
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (7, 3, '2018-07-14', '2018-07-23');
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (2, 2, '2018-06-15', '2018-07-20');
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (8, 2, '2018-06-15', '2018-07-20');
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (3, 6, '2018-06-09', '2018-07-02');
INSERT INTO carrental.`vehicle_has_equiment` (`equipment_id`, `vehicle_id`, `start_date`, `end_date`) VALUES (5, 6, '2018-06-09', '2018-07-02');
COMMIT;

-- -----------------------------------------------------
-- Table `rental_invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carrental.`rental_invoice` ;
CREATE TABLE IF NOT EXISTS carrental.`rental_invoice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_rent` DECIMAL(13,2) UNSIGNED NOT NULL,
  `equipment_rent_total` DECIMAL(13,2) UNSIGNED NULL,
  `insurance_cost_total` DECIMAL(13,2) UNSIGNED NULL,
  `tax_surcharges_and_fees` DECIMAL(13,2) UNSIGNED NOT NULL,
  `total_amount_payable` DECIMAL(13,2) UNSIGNED NOT NULL,
  `discount_amount` DECIMAL(13,2) UNSIGNED NULL,
  `net_amount_payable` DECIMAL(13,2) UNSIGNED NOT NULL,
  `rental_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_rental_invoice_rental_idx` (`rental_id` ASC),
  CONSTRAINT `fk_rental_invoice_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `rental` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table `rental_invoice`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO carrental.`rental_invoice` (`id`, `car_rent`, `equipment_rent_total`, `insurance_cost_total`, `tax_surcharges_and_fees`, `total_amount_payable`, `discount_amount`, `net_amount_payable`, `rental_id`) VALUES (1, 265.05, 206.82, 368.46, 73.99, 914.32, 79.52, 834.81, 1);
INSERT INTO carrental.`rental_invoice` (`id`, `car_rent`, `equipment_rent_total`, `insurance_cost_total`, `tax_surcharges_and_fees`, `total_amount_payable`, `discount_amount`, `net_amount_payable`, `rental_id`) VALUES (2, 53.54, 0, 94.98, 23.22, 171.74, 0, 171.74, 2);
INSERT INTO carrental.`rental_invoice` (`id`, `car_rent`, `equipment_rent_total`, `insurance_cost_total`, `tax_surcharges_and_fees`, `total_amount_payable`, `discount_amount`, `net_amount_payable`, `rental_id`) VALUES (3, 535.40, 459.60, 619.80, 169.98, 1784.78, 160.62, 1624.16, 3);
INSERT INTO carrental.`rental_invoice` (`id`, `car_rent`, `equipment_rent_total`, `insurance_cost_total`, `tax_surcharges_and_fees`, `total_amount_payable`, `discount_amount`, `net_amount_payable`, `rental_id`) VALUES (4, 824.56, 637.56, 1263.68, 503.34, 3229.14, 274.37, 2981.77, 4);
INSERT INTO carrental.`rental_invoice` (`id`, `car_rent`, `equipment_rent_total`, `insurance_cost_total`, `tax_surcharges_and_fees`, `total_amount_payable`, `discount_amount`, `net_amount_payable`, `rental_id`) VALUES (5, 452.53, 0, 402.87, 234.76, 1090.16, 135.76, 954.40, 5);
COMMIT;