select
	sum(l_extendedprice * l_discount) as revenue
from
	d0k02ll.lineitem
where
	l_shipdate >= date '1995-03-03'
	and l_shipdate < date '1995-03-03' + interval '1' year
	and l_discount between 0.05 - 0.01 and 0.05 + 0.01
	and l_quantity < 20.0
LIMIT 1
