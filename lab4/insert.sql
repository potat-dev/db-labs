-- Добавляем тестовые данные

insert into Store (id, name, address, contacts)
values (1, 'Компьютерный мир', 'ул. Ленина, 12', '+7 (495) 123-45-67'),
       (2, 'Техносила', 'пр. Мира, 34', '+7 (495) 234-56-78'),
       (3, 'Эльдорадо', 'ул. Строителей, 5', '+7 (495) 345-67-89'),
       (4, 'Медиамаркт', 'ул. Космонавтов, 7', '+7 (495) 456-78-90');

insert into Manufacturer (id, name, contacts)
values (1, 'Intel', 'info@intel.com'),
       (2, 'AMD', 'support@amd.com'),
       (3, 'Samsung', 'contact@samsung.com'),
       (4, 'LG', 'help@lg.com'),
       (5, 'Asus', 'service@asus.com'),
       (6, 'Lenovo', 'feedback@lenovo.com'),
       (7, 'HP', 'customer@hp.com'),
       (8, 'Dell', 'inquiry@dell.com');

insert into Component (id, type, model, manufacturer_id)
values (1, 'Процессор', 'Core i7-9700K', 1),
       (2, 'Процессор', 'Ryzen 7 3700X', 2),
       (3, 'Процессор', 'Core i5-9400F', 1),
       (4, 'Процессор', 'Ryzen 5 3600', 2),
       (5, 'Видеокарта', 'GeForce RTX 2080 Ti', 5),
       (6, 'Видеокарта', 'Radeon RX 5700 XT', 2),
       (7, 'Видеокарта', 'GeForce GTX 1660 Super', 5),
       (8, 'Видеокарта', 'Radeon RX 5500 XT', 2),
       (9, 'Оперативная память', '16 GB DDR4-3200', 3),
       (10, 'Оперативная память', '8 GB DDR4-2666', 4),
       (11, 'Оперативная память', '32 GB DDR4-3600', 3),
       (12, 'Оперативная память', '4 GB DDR4-2400', 4),
       (13, 'SSD', '1 TB M2 NVMe', 3),
       (14, 'SSD', '500 GB NVMe', 4),
       (15, 'HDD', '2 TB Super', 3),
       (16, 'HDD', '1 TB Pro', 4),
       (17, 'Монитор', '27" 4K IPS', 3),
       (18, 'Монитор', '24" Full HD TN', 4),
       (19, 'Монитор', '32" QHD VA', 3),
       (20, 'Монитор', '21.5" HD+ IPS', 4),
       (21, 'Клавиатура', 'Mechanical RGB', 5),
       (22, 'Клавиатура', 'Wireless Slim', 6),
       (23, 'Мышь', 'Gaming Laser', 5),
       (24, 'Мышь', 'Optical Bluetooth', 6),
       (25, 'Накопитель DVD', 'DVD-RW', 7),
       (26, 'Накопитель DVD', 'DVD-ROM', 8);

insert into Model (id, name, price, rating)
values (1, 'Asus ROG Strix G15', 120000, 5),
       (2, 'Lenovo IdeaPad 330', 40000, 3),
       (3, 'HP Pavilion 15', 60000, 4),
       (4, 'Dell Inspiron 15', 50000, 4),
       (5, 'Asus VivoBook 14', 45000, 3),
       (6, 'Lenovo ThinkPad X1', 90000, 4),
       (7, 'HP Omen 17', 150000, 5),
       (8, 'Dell XPS 13', 100000, 5);

insert into Supplier (id, name, contacts)
values (1, 'ООО "Комплект"', 'sales@komplekt.ru'),
       (2, 'ЗАО "Техноимпорт"', 'order@tehnoimport.com'),
       (3, 'ООО "Склад-Сервис"', 'info@sklad-service.ru'),
       (4, 'ООО "Экспресс-Доставка"', 'support@express-delivery.com');

insert into Ordering (id, model_id, store_id, price, person, address, registration)
values (1, 1, 1, 125000, 'Иванов И.И.', 'ул. Пушкина, 10', '2024-03-01'),
       (2, 2, 1, 42000, 'Петров П.П.', 'ул. Гагарина, 15', '2024-03-02'),
       (3, 3, 2, 62000, 'Сидоров С.С.', 'ул. Лермонтова, 20', '2024-03-03'),
       (4, 4, 2, 52000, 'Смирнов С.М.', 'ул. Чехова, 25', '2024-03-04'),
       (5, 5, 3, 47000, 'Кузнецов К.К.', 'ул. Толстого, 30', '2024-03-05'),
       (6, 6, 3, 95000, 'Новиков Н.Н.', 'ул. Достоевского, 35', '2024-03-06'),
       (7, 7, 4, 155000, 'Морозов М.М.', 'ул. Булгакова, 40', '2024-03-07'),
       (8, 8, 4, 105000, 'Соловьев С.С.', 'ул. Пастернака, 45', '2024-03-08');

insert into Delivery (id, ordering, departure, receipt, supplier_id)
values (1, 1, '2024-03-01', '2024-03-02', 1),
       (2, 2, '2024-03-02', '2024-03-03', 2),
       (3, 3, '2024-03-03', '2024-03-04', 3),
       (4, 4, '2024-03-04', '2024-03-05', 4),
       (5, 5, '2024-03-05', '2024-03-06', 1),
       (6, 6, '2024-03-06', '2024-03-07', 2),
       (7, 7, '2024-03-07', '2024-03-08', 3),
       (8, 8, '2024-03-08', '2024-03-09', 4);

insert into ModelsInShop (store_id, model_id)
values (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 3),
       (2, 4),
       (2, 5),
       (2, 6),
       (3, 5),
       (3, 6),
       (3, 7),
       (3, 8),
       (4, 1),
       (4, 2),
       (4, 7),
       (4, 8);

insert into ModelComponents (model_id, component_id)
values (1, 1),
       (1, 5),
       (1, 9),
       (1, 13),
       (1, 17),
       (1, 21),
       (1, 23),
       (1, 25),
       (2, 3),
       (2, 7),
       (2, 10),
       (2, 16),
       (2, 18),
       (2, 22),
       (2, 24),
       (2, 26),
       (3, 1),
       (3, 6),
       (3, 11),
       (3, 14),
       (3, 19),
       (3, 21),
       (3, 23),
       (3, 25),
       (4, 4),
       (4, 8),
       (4, 12),
       (4, 15),
       (4, 20),
       (4, 22),
       (4, 24),
       (4, 26),
       (5, 3),
       (5, 5),
       (5, 9),
       (5, 14),
       (5, 17),
       (5, 21),
       (5, 23),
       (5, 25),
       (6, 2),
       (6, 6),
       (6, 11),
       (6, 13),
       (6, 19),
       (6, 22),
       (6, 24),
       (6, 26),
       (7, 2),
       (7, 5),
       (7, 11),
       (7, 13),
       (7, 17),
       (7, 21),
       (7, 23),
       (7, 25),
       (8, 4),
       (8, 8),
       (8, 12),
       (8, 15),
       (8, 20),
       (8, 22),
       (8, 24),
       (8, 26);

-- Новые данные, для Лабы 4

insert into Model (id, name, price, rating)
values (9, 'Super Gaming PC Limited Edition', 150000, 5);

-- Добавляем SSD и HDD в таблицу ModelComponents
insert into ModelComponents (model_id, component_id)
values (9, 13),
       (9, 15);

-- Добавляем новый компонент без производителя
insert into Component (id, type, model, manufacturer_id)
values (27, 'Кулер', 'CoolMaster 5000', null);

insert into ModelComponents (model_id, component_id)
values (9, 27);

-- Добавляем новые компоненты DVD без производителя
insert into Component (id, type, model, manufacturer_id)
values (28, 'DVD', 'DVD-RW Pro', null),
       (29, 'DVD', 'DVD-ROM Ultra', null);

insert into ModelComponents (model_id, component_id)
values (1, 28),
       (2, 29);

insert into Store (id, name, address, contacts)
values (5, 'ТехноПланета', 'ул. Космическая, 1', '+7 (495) 567-89-01');

-- Добавляем все сборки, кроме сборок с id: 1, 3 и 5, в новый магазин
insert into ModelsInShop (store_id, model_id)
values (5, 2),
       (5, 4),
       (5, 6),
       (5, 7),
       (5, 8),
       (5, 9);

insert into Model (id, name, price, rating)
values (10, 'Ultra Gaming PC Rare Gold Edition', 200000, 5);

-- Добавляем все типы компонентов в таблицу ModelComponents
insert into ModelComponents (model_id, component_id)
values (10, 1),  -- Процессор
       (10, 5),  -- Видеокарта
       (10, 9),  -- Оперативная память
       (10, 13), -- SSD
       (10, 15), -- HDD
       (10, 17), -- Монитор
       (10, 21), -- Клавиатура
       (10, 23), -- Мышь
       (10, 25), -- Накопитель DVD
       (10, 27); -- Кулер

insert into Store (id, name, address, contacts)
values (6, 'Super Rare Store', 'ул. Неизвестная, 1', '+7 (499) 999-89-89');

-- Добавляем все сборки, кроме сборок с id: 1, 3 и 5, в новый магазин
insert into ModelsInShop (store_id, model_id)
values (6, 10);

-- Добавляем новых поставщиков
insert into Supplier (id, name, contacts)
values (5, 'ООО "Быстрая доставка"', 'fast@delivery.com'),
       (6, 'ООО "Мгновенная поставка"', 'instant@supply.com');

-- Добавляем новые поставки для новых поставщиков
insert into Delivery (id, ordering, departure, receipt, supplier_id)
values (9, 1, '2024-03-01', '2024-03-02', 5),
       (10, 2, '2024-03-02', '2024-03-03', 5),
       (11, 3, '2024-03-03', '2024-03-04', 5),
       (12, 4, '2024-03-04', '2024-03-05', 6),
       (13, 5, '2024-03-05', '2024-03-06', 6),
       (14, 6, '2024-03-06', '2024-03-07', 6),
       (15, 7, '2024-03-07', '2024-03-08', 6),
       (16, 8, '2024-03-08', '2024-03-09', 6);

-- Тестовые данные для лабы 6

insert into Component (id, type, model, manufacturer_id)
values (30, 'Блок питания', 'SuperPower 500W', 7);

-- Заполняем таблицу начальными данными
insert into ModelSales (model_id, total_sales)
select model_id, sum(price)
from Ordering
group by model_id;
