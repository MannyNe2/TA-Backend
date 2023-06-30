alter table "hindeke_db"."tickets_bought"
  add constraint "selam_tickets_bought_ticket_id_fkey"
  foreign key ("transaction_id")
  references "hindeke_db"."tickets_available"
  ("id") on update cascade on delete cascade;
