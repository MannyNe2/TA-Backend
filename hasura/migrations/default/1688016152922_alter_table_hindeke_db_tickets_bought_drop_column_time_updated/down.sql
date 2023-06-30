comment on column "hindeke_db"."tickets_bought"."time_updated" is E'The tickets bought or about to be bought from the given provider';
alter table "hindeke_db"."tickets_bought" alter column "time_updated" drop not null;
alter table "hindeke_db"."tickets_bought" add column "time_updated" timestamptz;
