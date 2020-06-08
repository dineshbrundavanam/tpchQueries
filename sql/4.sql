select
	o_orderpriority,
	count(*) as order_count
from
	d0k02ll.orders
where
	o_orderdate >= date '1995-03-03'
	and o_orderdate < date '1995-03-03' + interval '3' month
	and exists (
		select
			*
		from
			d0k02ll.lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority
LIMIT 1
