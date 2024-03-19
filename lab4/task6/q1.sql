-- Найти модели компьютеров, которые продаются только в одном магазине (использовать подзапросы)

SELECT m.name
FROM Model m
WHERE m.id IN (
    SELECT ms.model_id
    FROM ModelsInShop ms
    GROUP BY ms.model_id
    HAVING COUNT(ms.store_id) = 1
);
