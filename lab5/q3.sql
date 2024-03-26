-- Найти общее количество компьютеров во всех магазинах

create procedure TotalComputers()
begin
    select sum(quantity) as total_computers
    from (select count(*) as quantity
          from ModelsInShop
          group by store_id, model_id) as temp;
end;

call TotalComputers();
