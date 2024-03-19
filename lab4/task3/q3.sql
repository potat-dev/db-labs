-- Найти магазины, в которых продается наибольшее количество моделей

SELECT s.id, s.name, COUNT(mis.model_id) AS model_count
FROM Store s
JOIN ModelsInShop mis ON s.id = mis.store_id
GROUP BY s.id, s.name
ORDER BY model_count DESC
LIMIT 1;

-- Более правильный способ

WITH ModelCounts AS (
    SELECT store_id, COUNT(model_id) AS model_count
    FROM ModelsInShop
    GROUP BY store_id
),
MaxModelCount AS (
    SELECT MAX(model_count) AS max_count
    FROM ModelCounts
)
SELECT s.id, s.name, mc.model_count
FROM Store s
JOIN ModelCounts mc ON s.id = mc.store_id
JOIN MaxModelCount mmc ON mc.model_count = mmc.max_count;
