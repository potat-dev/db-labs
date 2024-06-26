-- Пересоздаем коллекцию

drop schema if exists lab;
create schema lab;
use lab;

-- Создаем таблицы

create table Store
(
    id       int auto_increment,
    name     varchar(127) not null,
    address  varchar(255) not null,
    contacts varchar(255) not null,
    primary key (id)
);

create table Manufacturer
(
    id       int auto_increment,
    name     varchar(128) not null,
    contacts varchar(255) not null,
    primary key (id)
);

create table Component
(
    id              int auto_increment,
    type            varchar(127) not null,
    model           varchar(127) not null,
    manufacturer_id int,
    primary key (id),
    foreign key (manufacturer_id) references Manufacturer (id) on delete cascade on update cascade
);

create table Model
(
    id     int auto_increment,
    name   varchar(255)   not null,
    price  decimal(10, 2) not null,
    rating int,
    primary key (id)
);

create table Supplier
(
    id       int auto_increment,
    name     varchar(128) not null,
    contacts varchar(255) not null,
    primary key (id)
);

create table Ordering
(
    id           int auto_increment,
    model_id     int           not null,
    store_id     int           not null,
    price        double(10, 2) not null,
    person       varchar(255)  not null,
    address      varchar(255)  not null,
    registration date          not null,
    primary key (id),
    foreign key (model_id) references Model (id) on delete cascade on update cascade,
    foreign key (store_id) references Store (id) on delete cascade on update cascade
);

create table Delivery
(
    id          int auto_increment,
    ordering    int  not null,
    departure   date not null,
    receipt     date not null,
    supplier_id int  not null,
    primary key (id),
    foreign key (ordering) references Ordering (id) on delete cascade on update cascade,
    foreign key (supplier_id) references Supplier (id) on delete cascade on update cascade
);

-- many-to-many tables

create table ModelsInShop
(
    store_id int not null,
    model_id int not null,
    foreign key (store_id) references Store (id) on delete cascade on update cascade,
    foreign key (model_id) references Model (id) on delete cascade on update cascade
);

create table ModelComponents
(
    model_id     int not null,
    component_id int not null,
    foreign key (model_id) references Model (id) on delete cascade on update cascade,
    foreign key (component_id) references Component (id) on delete cascade on update cascade
);

-- Новые таблицы для лабы 6

create table DeletedComponents
(
    id           int auto_increment,
    component_id int,
    deleted_at   timestamp default current_timestamp,
    primary key (id)
);

create table ModelUpdateLog
(
    model_id    int            not null,
    old_price   decimal(10, 2) not null,
    new_price   decimal(10, 2) not null,
    update_time varchar(255)   not null
);

create table DeletionLog
(
    id           int auto_increment,
    tableName    varchar(128) not null,
    deletedId    int          not null,
    deletionTime timestamp default current_timestamp,
    primary key (id)
);

create table ModelSales
(
    model_id    int primary key,
    total_sales decimal(10, 2) not null,
    foreign key (model_id) references Model (id)
);

create table OrderingHistory
(
    id             int,
    model_id       int,
    store_id       int,
    price          double(10, 2),
    person         varchar(255),
    address        varchar(255),
    registration   date,
    operation      varchar(10),
    operation_time timestamp
);
