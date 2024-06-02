-- Найти модели компьютеров, имеющие накопители DVD

select Model.name
from Model
         join ModelComponents on Model.id = ModelComponents.model_id
         join Component on ModelComponents.component_id = Component.id
where Component.type = 'DVD';
