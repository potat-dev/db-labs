-- Найти модели компьютеров, в которых используются как накопители SSD, так и HDD

select Model.name
from Model
where exists (select 1
              from ModelComponents
                       join Component on ModelComponents.component_id = Component.id
              where ModelComponents.model_id = Model.id
                and Component.type = 'SSD')
  and exists (select 1
              from ModelComponents
                       join Component on ModelComponents.component_id = Component.id
              where ModelComponents.model_id = Model.id
                and Component.type = 'HDD');
