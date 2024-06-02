-- триггеры для каждой операции, которые будут записывать информацию об изменениях в таблицу истории

create trigger after_ordering_insert
    after insert
    on Ordering
    for each row
    insert into OrderingHistory
    values (NEW.id, NEW.model_id, NEW.store_id, NEW.price, NEW.person, NEW.address, NEW.registration, 'INSERT', now());

create trigger after_ordering_update
    after update
    on Ordering
    for each row
    insert into OrderingHistory
    values (NEW.id, NEW.model_id, NEW.store_id, NEW.price, NEW.person, NEW.address, NEW.registration, 'UPDATE', now());

create trigger after_ordering_delete
    after delete
    on Ordering
    for each row
    insert into OrderingHistory
    values (OLD.id, OLD.model_id, OLD.store_id, OLD.price, OLD.person, OLD.address, OLD.registration, 'DELETE', now());

-- Вставка новой записи
insert into Ordering (model_id, store_id, price, person, address, registration)
values (1, 1, 130000, 'Смирнов С.М.', 'ул. Чехова, 25', '2024-04-01');

-- Обновление существующей записи
update Ordering
set price = 135000
where id = 1;

-- Удаление существующей записи
delete
from Ordering
where id = 2;
