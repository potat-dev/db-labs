-- Найти модели компьютеров, в которых используются как накопители SSD, так и HDD

SELECT Model.name
FROM Model
WHERE EXISTS (
    SELECT 1
    FROM ModelComponents
    JOIN Component ON ModelComponents.component_id = Component.id
    WHERE ModelComponents.model_id = Model.id AND Component.type = 'SSD'
) AND EXISTS (
    SELECT 1
    FROM ModelComponents
    JOIN Component ON ModelComponents.component_id = Component.id
    WHERE ModelComponents.model_id = Model.id AND Component.type = 'HDD'
);
