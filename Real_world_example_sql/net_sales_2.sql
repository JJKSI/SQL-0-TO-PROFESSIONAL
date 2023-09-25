# using  the new view table here
use gdb0041;

select *,
(net_invoice_sales - net_invoice_sales*post_invoice_discount) as net_sales
 from sales_post_invoice_dsicount;