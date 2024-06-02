-- Найти модели компьютеров, у которых не указан производитель (использовать IS NULL).

select Model.name
from Model
         left join ModelComponents on Model.id = ModelComponents.model_id
         left join Component on ModelComponents.component_id = Component.id
         left join Manufacturer on Component.manufacturer_id = Manufacturer.id
where Manufacturer.name is null;
