-- Триггер предотвращает удаление компонента, если он используется в модели
-- Если компонент не используется, он добавляется в таблицу DeletedComponents

create trigger prevent_component_deletion
    before delete
    on Component
    for each row
begin
    if (select count(*) from ModelComponents where component_id = OLD.id) > 0 then
        signal sqlstate '45000' set message_text = 'Cannot delete component that is used in a model';
    else
        insert into DeletedComponents (component_id) values (OLD.id);
    end if;
end;

-- Тестирование триггера

delete
from Component
where id = 1;

delete
from Component
where id = 27; -- компонент который нигде не используется
