insert into customer (username,password,created_at)values('sam',123456,'2010-05-06'),
('tony',123456,'2015-06-06'),('clark',321654,'2015-04-06'),('morse',654987,'2016-05-06'),('tia',258147,'2016-06-04');

insert into item (name,price)values('rice','$5/lb'),('flour','$10/lb'),('peanuts','$5/lb'),('onions','$2/lb'),('potatoes','$3/lb'),
('tomatoes','$2/lb'),('garlic','$5/lb'),('zuchini','$6/lb'),('coriander','$2 each'),('peppers','$3/lb');

insert into purchase (purchase_time, customer_id, item_id) 
values('2010-06-01 05:00:00', 1,1),('2010-06-15 05:00:00',1,2),('2010-07-01 06:00:00', 1, 3),('2010-07-01 06:00:00 ', 1, 4),('2010-08-01 06:00:00',1,5),
('2015-07-01 13:00:00',2,6),('2015-07-15 14:00:00',2,7),('2015-07-01 13:00:00',2,7);


from customer c inner join purchase p on c.