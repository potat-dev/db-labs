-- Классифицировать модели компьютеров по рейтингу: если рейтинг выше определенного значения, то модель относится к категории “TOP”; в противном случае модель относится к категории “OTHER”.

select name,
       case
           when rating > (select avg(rating) from Model)
               then 'TOP'
           else 'OTHER'
           end as rating_category
from Model;
