-- Найти магазины, в которых продается наибольшее количество моделей

select s.id, s.name, count(mis.model_id) as model_count
from Store s
         join ModelsInShop mis on s.id = mis.store_id
group by s.id, s.name
order by model_count desc
limit 1;

-- Более правильный способ

with ModelCounts as (select store_id, count(model_id) as model_count
                     from ModelsInShop
                     group by store_id),
     MaxModelCount as (select max(model_count) as max_count
                       from ModelCounts)
select s.id, s.name, mc.model_count
from Store s
         join ModelCounts mc on s.id = mc.store_id
         join MaxModelCount mmc on mc.model_count = mmc.max_count;
