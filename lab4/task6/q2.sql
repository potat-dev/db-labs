-- Найти магазины, которые продают только одну модель компьютера

SELECT s.name
FROM Store s
WHERE s.id IN (
    SELECT ms.store_id
    FROM ModelsInShop ms
    GROUP BY ms.store_id
    HAVING COUNT(ms.model_id) = 1
);
