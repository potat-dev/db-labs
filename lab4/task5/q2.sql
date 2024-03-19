-- Найти магазины, в которых не продаются модели, укомплектованные одновременно оборудованием Intel и Samsung

select Store.name
from Store
where not exists (select 1
                  from ModelsInShop
                           join Model on ModelsInShop.model_id = Model.id
                           join ModelComponents on Model.id = ModelComponents.model_id
                           join Component on ModelComponents.component_id = Component.id
                           join Manufacturer on Component.manufacturer_id = Manufacturer.id
                  where ModelsInShop.store_id = Store.id
                    and Manufacturer.name in ('Intel', 'Samsung')
                  group by Model.id
                  having count(distinct Manufacturer.name) = 2);

-- Вспомогательный запрос: ищем подходящие модели

select Model.id, Model.name
from Model
         join ModelComponents on Model.id = ModelComponents.model_id
         join Component on ModelComponents.component_id = Component.id
         join Manufacturer on Component.manufacturer_id = Manufacturer.id
where Manufacturer.name in ('Intel', 'Samsung')
group by Model.id
having count(distinct Manufacturer.name) = 2;
