-- Триггер, который будет проверять, существует ли производитель компонента перед добавлением нового компонента

create trigger check_manufacturer_before_insert
    before insert
    on Component
    for each row
begin
    declare manufacturer_exists int;
    select count(*) into manufacturer_exists from Manufacturer where id = NEW.manufacturer_id;
    if manufacturer_exists = 0 then
        signal sqlstate '45000' set message_text = 'Ошибка: Производитель с данным ID не существует.';
    end if;
end;

-- Тестирование триггера

insert into Component (type, model, manufacturer_id)
values ('Процессор', 'Core i9-10900K', 100);

insert into Component (type, model, manufacturer_id)
values ('Процессор', 'Core i9-10900K', 1);
