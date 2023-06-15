
create schema "hindeke_db";

CREATE TABLE "hindeke_db"."providers" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "provider_name" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("provider_name"));COMMENT ON TABLE "hindeke_db"."providers" IS E'Transportation providers contained within this table.';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "hindeke_db"."users" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "first_name" integer NOT NULL, "last_name" text NOT NULL, "email" text, "phone" integer NOT NULL, "type" text NOT NULL, "ticket_sold" integer, PRIMARY KEY ("id") );COMMENT ON TABLE "hindeke_db"."users" IS E'End users of the system';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "hindeke_db"."buses_available" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "car_type" text NOT NULL, "seat_size" int2 NOT NULL, "side_number" integer NOT NULL, "license_plate" text NOT NULL, "active" boolean NOT NULL, "provider_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("provider_id") REFERENCES "hindeke_db"."providers"("id") ON UPDATE restrict ON DELETE cascade);COMMENT ON TABLE "hindeke_db"."buses_available" IS E'Buses available of each provider';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "hindeke_db"."user_type" ("type" text NOT NULL, "description" text NOT NULL, PRIMARY KEY ("type") );COMMENT ON TABLE "hindeke_db"."user_type" IS E'Types of users using the system';

comment on TABLE "hindeke_db"."users" is E'Users of the system';

alter table "hindeke_db"."users"
  add constraint "users_type_fkey"
  foreign key ("type")
  references "hindeke_db"."user_type"
  ("type") on update cascade on delete cascade;

ALTER TABLE "hindeke_db"."users" ALTER COLUMN "first_name" TYPE Text;

alter table "hindeke_db"."users" add column "middle_name" text
 null;

alter table "hindeke_db"."users" alter column "middle_name" set not null;

CREATE TABLE "hindeke_db"."tickets_available" ("id" uuid NOT NULL, "departure_date" date NOT NULL, "start_location" text NOT NULL, "destination" text NOT NULL, "seats_left" int2 NOT NULL, "price" money NOT NULL, "bus_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("bus_id") REFERENCES "hindeke_db"."buses_available"("id") ON UPDATE cascade ON DELETE cascade);COMMENT ON TABLE "hindeke_db"."tickets_available" IS E'Tickets available from all providers';

alter table "hindeke_db"."users" add column "password" text
 not null;

ALTER TABLE "hindeke_db"."users" ALTER COLUMN "phone" TYPE Text;

alter table "hindeke_db"."users" alter column "type" set default 'user';

alter table "hindeke_db"."buses_available" add column "accomodations" Text[]
 null;

CREATE TABLE "hindeke_db"."selam_tickets_bought" ("id" uuid NOT NULL, "user_phone" text NOT NULL, "user_id" uuid NOT NULL, "ticket_id" uuid NOT NULL, "ticket_number" text NOT NULL, "paid" boolean NOT NULL DEFAULT false, "time_added" timestamptz NOT NULL DEFAULT now(), "time_updated" timestamptz NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_id") REFERENCES "hindeke_db"."users"("id") ON UPDATE no action ON DELETE no action, FOREIGN KEY ("ticket_id") REFERENCES "hindeke_db"."tickets_available"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("ticket_number"));COMMENT ON TABLE "hindeke_db"."selam_tickets_bought" IS E'The tickets bought or about to be bought from the given provider';

CREATE TABLE "hindeke_db"."selam_tickets_log" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "user_phone" text NOT NULL, "user_info" jsonb, "ticket_info" jsonb NOT NULL, "ticket_number" text NOT NULL, "paid" boolean NOT NULL, "time_added" timestamptz NOT NULL, "time_paid" timestamptz NOT NULL, PRIMARY KEY ("id") );COMMENT ON TABLE "hindeke_db"."selam_tickets_log" IS E'Logs for the tickets bought table for a specific provider';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
