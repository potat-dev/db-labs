-- Удаляем 2 TB HDD от Samsung

delete
from Component
where model = '2 TB HDD'
  and manufacturer_id = (select id from Manufacturer where name = 'Samsung');
