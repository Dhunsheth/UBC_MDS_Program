use db_dsheth;

CREATE TABLE Customer (

    customerId   int,

    customerName VARCHAR(30),

    city     VARCHAR(20),

    state        CHAR(2),

    PRIMARY KEY (customerId)  

);

create table Shipment (
  shipmentId integer,
  shipmentDate date,
  totalAmount decimal(9,2),
  shiptype char(2),
  customerId integer,
  primary key (shipmentId, shipmentDate),
  foreign key (customerId) references Customer(customerId) 
  on delete cascade 
  on update cascade
);

select * from Shipment;
select * from Customer;

insert into Customer values (1, 'Ofure', 'Kelowna', 'BC');
insert into Customer values (4, 'dhun', 'Van', 'BC');

insert into Shipment(shipmentId, shipmentDate, totalAmount, customerId) 
values (5,'2018-10-20',1000,4);

update Shipment set shiptype = 'PR' 
where shiptype is null or totalAmount > 2000;

delete from db_dsheth.Customer 
where Customer.customerId not in 
(select distinct Shipment.customerID from db_dsheth.Shipment) 
and upper(Customer.customerName) like '%A%';

select * from Customer
order by Customer.customerId desc
limit 3 offset 1;

select Customer.city, avg(Shipment.totalAmount) as avg_amt
from db_dsheth.Customer join db_dsheth.Shipment on Customer.customerId = Shipment.customerId
group by Customer.city
having avg(Shipment.totalAmount) > 500
order by Customer.city;

drop table Customer
