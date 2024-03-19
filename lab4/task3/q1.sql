-- Найти количество моделей, продаваемых в каждом из магазинов.

SELECT Store.id AS store_id, Store.name AS store_name, COUNT(Model.id) AS model_count
FROM Store
JOIN ModelsInShop ON Store.id = ModelsInShop.store_id
JOIN Model ON ModelsInShop.model_id = Model.id
GROUP BY Store.id, Store.name;
