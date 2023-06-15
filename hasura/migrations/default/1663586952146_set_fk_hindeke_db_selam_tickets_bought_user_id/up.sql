alter table "hindeke_db"."selam_tickets_bought" drop constraint "selam_tickets_bought_user_id_fkey",
  add constraint "selam_tickets_bought_user_id_fkey"
  foreign key ("user_id")
  references "hindeke_db"."users"
  ("id") on update cascade on delete cascade;
