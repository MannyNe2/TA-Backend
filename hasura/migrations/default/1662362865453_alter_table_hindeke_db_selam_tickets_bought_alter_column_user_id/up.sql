alter table "hindeke_db"."selam_tickets_bought" alter column "user_id" set default gen_random_uuid();
alter table "hindeke_db"."selam_tickets_bought" alter column "user_id" set not null;
