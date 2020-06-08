select
	n_name,
	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	d0k02ll.customer,
	d0k02ll.orders,
	d0k02ll.lineitem,
	d0k02ll.supplier,
	d0k02ll.nation,
	d0k02ll.region
where
	c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and l_suppkey = s_suppkey
	and c_nationkey = s_nation
	and s_nation = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'ASIA'
	and o_orderdate >= date '1995-03-03'
	and o_orderdate < date '1995-03-03' + interval '1' year
group by
	n_name
order by
	revenue desc
LIMIT 1
