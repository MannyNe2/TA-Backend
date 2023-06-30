alter table "hindeke_db"."tickets_bought" add column "created_at" timestamptz
 null default now();
