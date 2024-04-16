-- Триггер будет автоматически добавлять запись в таблицу DeletionLog каждый раз, когда строка удаляется из таблицы Ordering

create trigger after_ordering_delete
    after delete
    on Ordering
    for each row
begin
    insert into DeletionLog (tableName, deletedId)
    values ('Ordering', OLD.id);
end;

delete
from Ordering
where id = 1;

select *
from DeletionLog;
