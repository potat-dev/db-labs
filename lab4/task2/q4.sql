-- Найти модели компьютеров с ценой между определенными значениями (использовать BETWEEN … AND …)

select *
from Model
where price between 50000 and 120000;
