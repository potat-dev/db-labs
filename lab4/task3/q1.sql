-- Найти количество моделей, продаваемых в каждом из магазинов.

select Store.id as store_id, Store.name as store_name, count(Model.id) as model_count
from Store
         join ModelsInShop on Store.id = ModelsInShop.store_id
         join Model on ModelsInShop.model_id = Model.id
group by Store.id, Store.name;
