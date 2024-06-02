-- Процедура которая добавляет компонент и производителя при необходимости

create procedure InsertComponent(
    in comp_type varchar(127),
    in comp_model varchar(127),
    in manuf_name varchar(128),
    in manuf_contacts varchar(255)
)
begin
    declare manuf_id int;

    select id
    into manuf_id
    from Manufacturer
    where name = manuf_name;

    if manuf_id is null then
        insert into Manufacturer (name, contacts)
        values (manuf_name, manuf_contacts);
    end if;

    insert into Component (type, model, manufacturer_id)
    values (comp_type, comp_model, manuf_id);
end;

call InsertComponent('Процессор', 'Mi Super Chip', 'Xiaomi', 'mi@xiaomi.com');
