use random_tables;

SELECT 
    *,
    amount * 100 / (SELECT SUM(amount) FROM expenses)  AS the_percent_of_contribution
FROM expenses
order by category;

# over will return all the records
# partition by category works as a group by 
select 
*,
amount*100/sum(amount) over(partition by category) as the_percent_of_contribution
from expenses
order by category;


select 
* ,
sum(amount) over( partition by category order by date) as total_expense_till_date
from expenses
order by category,date;