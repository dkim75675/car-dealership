
-- Function for adding information to the car table

create function add_car(_serial_number INTEGER, _make VARCHAR, _model VARCHAR, _year INTEGER, _mileage INTEGER)
returns void 
as $MAIN$
begin
	insert into car(serial_number, make, model, "year", mileage)
	values(_serial_number, _make, _model, _year, _mileage);
end;
$MAIN$
language plpgsql;

select add_car(1111, 'toyota', 'corolla', 2023, 0);
select add_car(2222, 'toyota', 'tundra', 2017, 50000);


-- Function to add customer information to customer table
create function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone VARCHAR, _address VARCHAR, _email VARCHAR)
returns void 
as $MAIN$
begin
	insert into customer(customer_id, first_name, last_name, phone, address, email)
	values(_customer_id, _first_name, _last_name, _phone, _address, _email);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Kenny', 'Lee', '111-222-3333', '111 Main St', 'example1@email.com');
select add_customer(2, 'Bob', 'Kim', '111-222-3334', '113 Main St', 'example2@email.com');


-- Function to add information to sales table
create function add_sales(_staff_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin
	insert into sales(staff_id, first_name, last_name)
	values(_staff_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_sales(4, 'Ryan', 'Johnson');
select add_sales(8, 'James', 'Bjorg');


-- Function to add information to mechanic table
create function add_mech(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin
	insert into mechanic(mechanic_id, first_name, last_name)
	values(_mechanic_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_mech(818, 'Preston', 'Scott');
select add_mech(222, 'Meg', 'Kingbury');


-- Function to add information to parts table
create function add_parts(_part_id INTEGER, _sub_total NUMERIC, _total_cost NUMERIC)
returns void
as $MAIN$
begin
	insert into parts(part_id, sub_total, total_cost)
	values(_part_id, _sub_total, _total_cost);
end;
$MAIN$
language plpgsql;

select add_parts(99, 110.00, 122.57);
select add_parts(115, 99.00, 107.36);


--manual insertion of data into service table
insert into service(ticket_id, serial_number, customer_id, mechanic_id, service_provided, part_id)
values(12, 1111, 1, 818, 'Oil change', 99);

insert into service(ticket_id, serial_number, customer_id, mechanic_id, service_provided, part_id)
values(13, 2222, 2, 222, 'tire rotation', 115);


-- Function to add information to history table
create function add_history(_service_id INTEGER, _customer_id INTEGER, _serial_number INTEGER, _ticket_id INTEGER)
returns void
as $MAIN$
begin
	insert into history(service_id, customer_id, serial_number, ticket_id)
	values(_service_id, _customer_id, _serial_number, _ticket_id);
end;
$MAIN$
language plpgsql;

select add_history(1, 1, 1111, 12);
select add_history(2, 2, 2222, 13);


--manual insertion of data into invoice table
insert into invoice(invoice_id, invoice_date, sub_total, total_cost, customer_id, serial_number, staff_id)
values(245, '2023-02-20', 100.00, 250.00, 1, 1111, 4);

insert into invoice(invoice_id, invoice_date, sub_total, total_cost, customer_id, serial_number, staff_id)
values(300, '2022-08-01', 150.00, 375.00, 2, 2222, 8);



