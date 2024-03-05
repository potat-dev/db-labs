-- Добавляем CASCADE

alter table Component
    add constraint FK_Component_Manufacturer
        foreign key (manufacturer_id) references Manufacturer (id)
            on delete cascade on update cascade;

alter table Ordering
    add constraint FK_Ordering_Model
        foreign key (model_id) references Model (id)
            on delete cascade on update cascade,
    add constraint FK_Ordering_Store
        foreign key (store_id) references Store (id)
            on delete cascade on update cascade;

alter table Delivery
    add constraint FK_Delivery_Ordering
        foreign key (ordering) references Ordering (id)
            on delete cascade on update cascade,
    add constraint FK_Delivery_Supplier
        foreign key (supplier_id) references Supplier (id)
            on delete cascade on update cascade;

alter table ModelsInShop
    add constraint FK_ModelsInShop_Store
        foreign key (store_id) references Store (id)
            on delete cascade on update cascade,
    add constraint FK_ModelsInShop_Model
        foreign key (model_id) references Model (id)
            on delete cascade on update cascade;

alter table ModelComponents
    add constraint FK_ModelComponents_Model
        foreign key (model_id) references Model (id)
            on delete cascade on update cascade,
    add constraint FK_ModelComponents_Component
        foreign key (component_id) references Component (id)
            on delete cascade on update cascade;
