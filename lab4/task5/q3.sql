-- Найти модели компьютеров, укомплектованные всеми типами периферийных устройств

SELECT m.name
FROM Model m
WHERE NOT EXISTS (
    SELECT type
    FROM Component
    WHERE type IN ('Видеокарта', 'Оперативная память', 'SSD', 'HDD', 'Монитор', 'Клавиатура', 'Мышь', 'Накопитель DVD', 'Кулер')
    AND type NOT IN (
        SELECT c.type
        FROM ModelComponents mc
        JOIN Component c ON mc.component_id = c.id
        WHERE mc.model_id = m.id
    )
);
