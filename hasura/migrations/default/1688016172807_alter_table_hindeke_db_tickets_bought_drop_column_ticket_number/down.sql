comment on column "hindeke_db"."tickets_bought"."ticket_number" is E'The tickets bought or about to be bought from the given provider';
alter table "hindeke_db"."tickets_bought" add constraint "selam_tickets_bought_ticket_number_key" unique (ticket_number);
alter table "hindeke_db"."tickets_bought" alter column "ticket_number" drop not null;
alter table "hindeke_db"."tickets_bought" add column "ticket_number" text;
