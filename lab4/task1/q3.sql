-- Найти пары моделей компьютеров с одинаковым рейтингом
-- (Старое: Найти модели компьютеров, имеющие одинаковый размер оперативной и внешней памяти)

select m1.name as model1, m2.name as model2, m1.rating, m2.rating
from Model m1
         join Model m2 on m1.rating = m2.rating and m1.id < m2.id
