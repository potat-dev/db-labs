-- Процедура, которая будет удалять модель и все связанные с ней заказы

create procedure DeleteModelWithOrders(in model_id int)
scope:
begin
    if not exists (select * from Model where id = model_id) then
        leave scope;
    end if;

    delete from Ordering where Ordering.model_id = model_id;
    delete from Model where id = model_id;
end;

call DeleteModelWithOrders(1);

call DeleteModelWithOrders(666);
