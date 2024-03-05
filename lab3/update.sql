-- Заменяем компонент в модели

update ModelComponents
set component_id = (select id
                    from Component
                    where model = '1 TB HDD'
                      and manufacturer_id = (select id from Manufacturer where name = 'LG'))
where model_id = (select id from Model where name = 'Lenovo ThinkPad X1')
  and component_id in (select id from Component where type = 'Внешняя память');
