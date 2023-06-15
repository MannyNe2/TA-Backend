// ADD THE QUERY FROM GRAPHQLI TO ADD NEW USER
const addTicket = (provider) => `mutation addTicket($user_id: uuid, $user_phone: String!, $ticket_id: uuid!, $ticket_number: String!, $time_updated: timestamptz = now) {
  ticketData: insert_${provider}_tickets_bought_one(object: {user_id: $user_id, user_phone: $user_phone, ticket_id: $ticket_id, ticket_number: $ticket_number, time_updated: $time_updated}) {
    ticket_number
    ticket_info {
      departure_date
      start_location
      destination
      seats_left
      price
      buses_available {
        accomodations
      }
    }
  }
}`;

const authQueries = {
    addTicket
};

module.exports = { addTicket }