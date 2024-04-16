-- Триггер, который будет проверять, есть ли уже в таблице Model модель с таким же именем, что и вставляемая

create trigger check_model_name
    before insert
    on Model
    for each row
begin
    if exists (select 1 from Model where name = NEW.name) then
        signal sqlstate '45000' set message_text = 'Модель с таким именем уже существует!';
    end if;
end;

insert into Model (name, price, rating)
values ('Asus ROG Strix G15', 120000, 5);
