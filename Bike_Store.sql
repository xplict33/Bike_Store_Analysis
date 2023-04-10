use Bike_Store;

select ord.order_id, 
	CONCAT(cus.first_name, ' ', cus.last_name) as 'cust_name',
	cus.city,
	cus.state,
	ord.order_date, 
	sum(ite.quantity) as 'total_units',
	sum(ite.quantity * ite.list_price) as 'revenue',
	pp.product_name,
	pc.category_name,
	ss.store_name,
	pb.brand_name,
	CONCAT(stf.first_name, ' ', stf.last_name) as 'sales_rep'
from sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id

join sales.order_items ite
on ord.order_id = ite.order_id

join production.products pp
on ite.product_id = pp.product_id


join production.categories pc
on pp.category_id = pc.category_id

join sales.stores ss
on ord.store_id = ss.store_id

join production.brands pb
on pp.brand_id = pb.brand_id

join sales.staffs stf
on ord.staff_id = stf.staff_id

group by
	ord.order_id, 
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pp.product_name,
	pc.category_name,
	ss.store_name,
	pb.brand_name,
	CONCAT(stf.first_name, ' ', stf.last_name);


select 6&7;