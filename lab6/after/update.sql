-- Триггер записывает информацию об обновлении цены модели в таблицу ModelUpdateLog

create trigger after_update_model
    after update
    on Model
    for each row
begin
    insert into ModelUpdateLog (model_id, old_price, new_price, update_time)
    values (OLD.id, OLD.price, NEW.price, now());
end;

update Model
set price = 130000
where id = 1;

update Model
set price = 140000
where id = 1;
