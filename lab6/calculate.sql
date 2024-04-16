-- Триггер, который будет обновлять ModelSales таблицу каждый раз, когда добавляется новый заказ в таблицу Ordering

create trigger update_total_sales
    after insert
    on Ordering
    for each row
begin
    if NEW.model_id is not null then
        update ModelSales
        set total_sales = total_sales + NEW.price
        where model_id = NEW.model_id;
    end if;
end;

insert into Ordering (model_id, store_id, price, person, address, registration)
values (1, 1, 130000, 'Иванов И.И.', 'ул. Пушкина, 10', '2024-04-01');
