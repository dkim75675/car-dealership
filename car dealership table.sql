CREATE TABLE customer (
  customer_id SERIAL,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  phone VARCHAR(20),
  address VARCHAR(200),
  email  VARCHAR(200),
  PRIMARY KEY (customer_id)
);

CREATE TABLE car (
  serial_number SERIAL,
  make VARCHAR(150),
  model VARCHAR(150),
  year INTEGER,
  mileage INTEGER,
  PRIMARY KEY (serial_number)
);

CREATE TABLE Sales (
  staff_id SERIAL,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  PRIMARY KEY (staff_id)
);

CREATE TABLE Invoice (
  invoice_id SERIAL,
  invoice_date DATE,
  sub_total NUMERIC(8,2),
  total_cost NUMERIC(8,2),
  customer_id INTEGER,
  serial_number INTEGER,
  staff_id INTEGER,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (customer_id) references customer(customer_id),
  FOREIGN KEY(serial_number) references car(serial_number),
  FOREIGN KEY (staff_id) references sales(staff_id)
);

CREATE TABLE History (
  service_id SERIAL,
  customer_id INTEGER,
  serial_number INTEGER,
  ticket_id INTEGER,
  PRIMARY KEY (service_id),
  FOREIGN KEY (customer_id) references customer(customer_id),
  FOREIGN KEY(serial_number) references car(serial_number),
  FOREIGN KEY(ticket_id) references service(ticket_id)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  PRIMARY KEY (mechanic_id)
);

CREATE TABLE Parts (
  part_id SERIAL,
  sub_total NUMERIC(8,2),
  total_cost NUMERIC(8,2),
  PRIMARY KEY (part_id)
);

CREATE TABLE Service (
  ticket_id SERIAL,
  serial_number INTEGER,
  customer_id INTEGER,
  mechanic_id INTEGER,
  service_provided VARCHAR(300),
  part_id INTEGER,
  PRIMARY KEY (ticket_id),
  FOREIGN KEY (customer_id) references customer(customer_id),
  FOREIGN KEY(serial_number) references car(serial_number),
  FOREIGN KEY (mechanic_id) references mechanic(mechanic_id),
  FOREIGN KEY(part_id) references parts(part_id)
);