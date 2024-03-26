-- Запрос, который увеличивает цену на модели, которые доступны только в одном магазине

update Model
set price = price * 1.1
where id in (select model_id
             from ModelsInShop
             group by model_id
             having count(store_id) = 1);

select name, price
from Model
where id in (select model_id
             from ModelsInShop
             group by model_id
             having count(store_id) = 1);
