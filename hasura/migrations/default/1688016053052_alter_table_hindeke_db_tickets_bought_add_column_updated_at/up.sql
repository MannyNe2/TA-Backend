alter table "hindeke_db"."tickets_bought" add column "updated_at" timestamptz
 null default now();

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
CREATE TRIGGER "set_hindeke_db_tickets_bought_updated_at"
BEFORE UPDATE ON "hindeke_db"."tickets_bought"
FOR EACH ROW
EXECUTE PROCEDURE "hindeke_db"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_hindeke_db_tickets_bought_updated_at" ON "hindeke_db"."tickets_bought" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
