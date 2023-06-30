comment on column "hindeke_db"."tickets_bought"."paid" is E'The tickets bought or about to be bought from the given provider';
alter table "hindeke_db"."tickets_bought" alter column "paid" set default false;
alter table "hindeke_db"."tickets_bought" alter column "paid" drop not null;
alter table "hindeke_db"."tickets_bought" add column "paid" bool;
