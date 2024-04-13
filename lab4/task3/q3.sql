-- Найти магазины, в которых продается наибольшее количество моделей

with ModelCounts as (select store_id, count(model_id) as model_count
                     from ModelsInShop
                     group by store_id),
     MaxModelCount as (select max(model_count) as max_count
                       from ModelCounts)
select s.id, s.name, mc.model_count
from Store s
         join ModelCounts mc on s.id = mc.store_id
         join MaxModelCount mmc on mc.model_count = mmc.max_count;
