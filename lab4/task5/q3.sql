-- Найти модели компьютеров, укомплектованные всеми типами периферийных устройств

select m.name
from Model m
where not exists (select type
                  from Component
                  where type in ('Видеокарта', 'Оперативная память', 'SSD', 'HDD', 'Монитор', 'Клавиатура', 'Мышь',
                                 'Накопитель DVD', 'Кулер')
                    and type not in (select c.type
                                     from ModelComponents mc
                                              join Component c on mc.component_id = c.id
                                     where mc.model_id = m.id));
