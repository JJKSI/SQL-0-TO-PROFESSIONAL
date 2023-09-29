use random_tables;

# show top 2 expenses in each category

with cte1 as (select
 *,
 row_number() over(partition by category order  by amount desc)  as rn,
 rank() over(partition by category order  by amount desc)  as rnk,
 dense_rank() over(partition by category order  by amount desc)  as drank
 from expenses
order by category)
select * from cte1
where drank<=2;