alter table "hindeke_db"."tickets_bought"
  add constraint "tickets_bought_transaction_id_fkey"
  foreign key ("transaction_id")
  references "hindeke_db"."transaction"
  ("id") on update cascade on delete restrict;
