
DROP TABLE "hindeke_db"."selam_tickets_log";

DROP TABLE "hindeke_db"."selam_tickets_bought";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "hindeke_db"."buses_available" add column "accomodations" Text[]
--  null;

ALTER TABLE "hindeke_db"."users" ALTER COLUMN "type" drop default;

ALTER TABLE "hindeke_db"."users" ALTER COLUMN "phone" TYPE integer;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "hindeke_db"."users" add column "password" text
--  not null;

DROP TABLE "hindeke_db"."tickets_available";

alter table "hindeke_db"."users" alter column "middle_name" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "hindeke_db"."users" add column "middle_name" text
--  null;

ALTER TABLE "hindeke_db"."users" ALTER COLUMN "first_name" TYPE integer;

alter table "hindeke_db"."users" drop constraint "users_type_fkey";

comment on TABLE "hindeke_db"."users" is E'NULL';

DROP TABLE "hindeke_db"."user_type";

DROP TABLE "hindeke_db"."buses_available";

DROP TABLE "hindeke_db"."users";

DROP TABLE "hindeke_db"."providers";

drop schema "hindeke_db" cascade;
