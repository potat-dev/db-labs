-- Классифицировать поставщиков по количеству поставок: если количество поставок текущего поставщика превышает количество поставок других поставщиков, то поставщик относится к категории BEST; в противном случае поставщик относится к категории OTHER.

select name,
       case
           when (select count(*) from Delivery where supplier_id = Supplier.id) >
                (select avg(delivery_count)
                 from (select count(*) as delivery_count
                       from Delivery
                       group by supplier_id) as DeliveryCounts)
               then 'BEST'
           else 'OTHER'
           end as supplier_category
from Supplier;
