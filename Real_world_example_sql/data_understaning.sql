use gdb0041;

select distinct(market) from dim_customer;

select distinct channel from dim_customer;

# Similarly we can check our data and its value using the distinct functions

select distinct segment from dim_product;

select distinct category from dim_product;

# BREAKDOWN IN PRODUCTS WE HAVE IS
--  DIVISION -> SEGMENT -> CATEGORY -> PRODUCT -> VARIANT