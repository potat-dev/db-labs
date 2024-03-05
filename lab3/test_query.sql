-- Находим модели с памятью от Samsung

select Model.id          as model_id,
       Model.name        as model_name,
       Component.id      as component_id,
       Component.type    as component_type,
       Component.model   as component_model,
       Manufacturer.name as manufacturer_name
from Model
         join ModelComponents on Model.id = ModelComponents.model_id
         join Component on ModelComponents.component_id = Component.id
         join Manufacturer on Component.manufacturer_id = Manufacturer.id
where Component.type = 'Внешняя память'
  and Manufacturer.name = 'Samsung';

-- Последовательность запуска:
-- 0. Alter tables
-- 1. Insert -> Test
-- 2. Update -> Test
-- 3. Delete -> Test
