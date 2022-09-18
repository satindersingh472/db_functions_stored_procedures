insert into customer (username,password,created_at)values('sam',123456,'2010-05-06'),
('tony',123456,'2015-06-06'),('clark',321654,'2015-04-06'),('morse',654987,'2016-05-06'),('tia',258147,'2016-06-04');

insert into item (name,price)values('rice','$5/lb'),('flour','$10/lb'),('peanuts','$5/lb'),('onions','$2/lb'),('potatoes','$3/lb'),
('tomatoes','$2/lb'),('garlic','$5/lb'),('zuchini','$6/lb'),('coriander','$2 each'),('peppers','$3/lb');

insert into purchase (purchase_time, customer_id, item_id) 
values('2010-06-01 05:00:00', 1,1),('2010-06-15 05:00:00',1,2),('2010-07-01 06:00:00', 1, 3),('2010-07-01 06:00:00 ', 1, 4),('2010-08-01 06:00:00',1,5),
('2015-07-01 13:00:00',2,6),('2015-07-15 14:00:00',2,7),('2015-07-01 13:00:00',2,7);

insert into purchase(purchase_time, customer_id, item_id)
values('2016-01-05 07:00:00', 3, 4),('2016-01-05 07:00:00', 3, 6),('2016-01-05 08:00:00', 4, 8),('2016-01-06 07:00:00',4,9);

insert into purchase(purchase_time, customer_id, item_id)
values('2015-07-01 13:00:00', 4, 9);

insert into purchase(purchase_time, customer_id, item_id)
values('2015-07-01 14:00:00',5, 10);

insert into purchase(purchase_time, customer_id, item_id)
values('2020-07-01 14:00:00',3, 3),('2020-07-01 14:00:00',3,5),('2020-07-01 14:00:00',3,8),('2020-07-01 16:00:00',3,5);

insert into purchase(purchase_time, customer_id, item_id)
values('2021-08-02 15:00:00',4, 4),('2021-08-02 15:00:00',4,5),('2021-08-02 15:00:00',4,10),('2021-08-05 16:00:00',4,2);

insert into purchase(purchase_time, customer_id, item_id)
values('2022-09-03 16:00:00',5, 2),('2022-09-03 16:00:00',5,8),('2022-10-02 15:00:00',5,10),('2022-10-05 16:00:00',5,1);

insert into purchase(purchase_time, customer_id, item_id)
values('2022-09-03 15:00:00',4, 4),('2020-08-02 15:00:00',5,4),('2019-08-02 15:00:00',5,10),('2018-08-05 16:00:00',2,7);

-- querie for 5 most recent purchases
	select c.username,i.name,p.purchase_time  
	from purchase p inner join customer c on c.id = p.customer_id inner join item i on i.id = p.item_id
	order by p.purchase_time  desc
	limit 5;

-- call for stored procedure for 5 recent purchases
call five_recent_purchases();

-- call for  stored procedure for customer purchases with customer id(s)
call customer_purchases(1); 
call customer_purchases(2);
call customer_purchases(3);
call customer_purchases(4);
call customer_purchases(5);

-- select STATEMENT to return username and count of purchases
SELECT count(p.id),c.username
	from purchase p inner join customer c on p.customer_id = c.id
	group by c.id;
	
-- select statment for money spent by any customer after 2022-01-01 01:00:00
select c.username,COUNT(p.id),sum(i.price)
from purchase p inner join item i on i.id = p.item_id inner join customer c on c.id = p.customer_id
where p.purchase_time > '2022-01-01 01:00:00'
group by c.id;


-- call for stored procedures total amount of money spent by any customer
call purchase_dates ('2022-01-01 12:00:00 ', 3);
call purchase_dates ('2022-01-01 12:00:00',4);
call purchase_dates ('2020-07-01 14:00:00' ,3);



