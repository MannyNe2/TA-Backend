CREATE TABLE "hindeke_db"."transaction" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "ticket_id" uuid NOT NULL, "status" text NOT NULL, "amount" money NOT NULL, "timeout" Numeric NOT NULL DEFAULT 60000, "user" uuid NOT NULL, "from" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("user") REFERENCES "hindeke_db"."users"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("ticket_id") REFERENCES "hindeke_db"."tickets_available"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "hindeke_db"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_hindeke_db_transaction_updated_at"
BEFORE UPDATE ON "hindeke_db"."transaction"
FOR EACH ROW
EXECUTE PROCEDURE "hindeke_db"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_hindeke_db_transaction_updated_at" ON "hindeke_db"."transaction" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
