-- Найти модели компьютеров, которые есть в определенном списке (использовать IN)

select *
from Model
where name in ('Dell XPS 13', 'Lenovo ThinkPad X1', 'Super Gaming PC Limited Edition');
