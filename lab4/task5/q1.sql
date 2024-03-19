-- Найти модели компьютеров, имеющие накопители DVD

SELECT Model.name
FROM Model
JOIN ModelComponents ON Model.id = ModelComponents.model_id
JOIN Component ON ModelComponents.component_id = Component.id
WHERE Component.type = 'DVD';
