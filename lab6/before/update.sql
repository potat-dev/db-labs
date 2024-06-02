-- Триггер обновляет цену в таблице Ordering при изменении цены модели в таблице Model

create trigger update_model_price
    before update
    on Model
    for each row
begin
    if OLD.price != NEW.price then
        update Ordering set price = NEW.price where model_id = OLD.id;
    end if;
end;

-- Тестирование триггера

select (select price from Model where id = 1)          as 'Model Price',
       (select price from Ordering where model_id = 1) as 'Order Price';

update Model
set price = 130000
where id = 1;

select (select price from Model where id = 1)          as 'Model Price',
       (select price from Ordering where model_id = 1) as 'Order Price';
