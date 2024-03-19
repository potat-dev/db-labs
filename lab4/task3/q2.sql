-- Найти магазины, в которых средняя цена компьютера ниже, чем в других.

SELECT s.id, s.name
FROM Store s
WHERE (
    SELECT AVG(m.price)
    FROM Model m
    JOIN ModelsInShop ms ON m.id = ms.model_id
    WHERE ms.store_id = s.id
) < (
    SELECT AVG(m.price)
    FROM Model m
);
