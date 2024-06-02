-- Создать и выполнить запросы с использованием конструкции CASE и / или функции COALESCE
-- Классифицировать модели компьютеров по цене: свыше 100000 “PREMIUM”, от 50000 до 100000 “MID-RANGE”, в противном случае “CHEAP”.

select name,
       case
           when price > 100000 then 'PREMIUM'
           when price between 50000 and 100000 then 'MID-RANGE'
           else 'CHEAP'
           end as price_category
from Model;
