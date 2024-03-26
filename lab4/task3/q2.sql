-- Найти магазины, в которых средняя цена компьютера ниже, чем в других.

select s.id, s.name
from Store s
where (select avg(m.price)
       from Model m
                join ModelsInShop ms on m.id = ms.model_id
       where ms.store_id = s.id) < (select avg(m.price)
                                    from Model m);
