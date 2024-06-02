-- Формируем статистику по магазинам во временной таблице

create procedure StoreStatistics()
begin
    create temporary table StoreStats
    (
        store_id          int,
        model_count       int,
        order_count       int,
        avg_model_price   decimal(10, 2),
        total_order_price decimal(10, 2)
    );

    insert into StoreStats
    select s.id                                                                    as store_id,
           (select count(*) from ModelsInShop where store_id = s.id)               as model_count,
           (select count(*) from Ordering where store_id = s.id)                   as order_count,
           (select avg(price)
            from Model
            where id in (select model_id from ModelsInShop where store_id = s.id)) as avg_model_price,
           (select sum(price) from Ordering where store_id = s.id)                 as total_order_price
    from Store s;

    select * from StoreStats;
end;

call StoreStatistics();
