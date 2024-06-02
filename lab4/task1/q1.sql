-- Находим модели с памятью от Samsung

select Model.name
from Model
         join ModelComponents on Model.id = ModelComponents.model_id
         join Component on ModelComponents.component_id = Component.id
         join Manufacturer on Component.manufacturer_id = Manufacturer.id
where Component.type = 'HDD'
  and Manufacturer.name = 'Samsung';
