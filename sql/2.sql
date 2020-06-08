select
	s_acctbal,
	s_name,
	n_name,
	p_partkey,
	p_mfgr,
	s_address,
	s_phone,
	s_comment
from
	d0k02ll.part,
	d0k02ll.supplier,
	d0k02ll.partsupp,
	d0k02ll.nation,
	d0k02ll.region
where
	p_partkey = ps_partkey
	and s_suppkey = ps_suppkey
	and p_size = 41
	and p_type like '%TIN'
	and s_nation = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'ASIA'
	and ps_supplycost = (
		select
			min(ps_supplycost)
		from
			d0k02ll.partsupp,
			d0k02ll.supplier,
			d0k02ll.nation,
			d0k02ll.region
		where
			p_partkey = ps_partkey
			and s_suppkey = ps_suppkey
			and s_nation = n_nationkey
			and n_regionkey = r_regionkey
			and r_name = 'ASIA'
	)
order by
	s_acctbal desc,
	n_name,
	s_name,
	p_partkey
LIMIT 20
