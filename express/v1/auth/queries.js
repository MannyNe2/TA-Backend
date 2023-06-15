// ADD THE QUERY FROM GRAPHQLI TO ADD NEW USER
const createUser = `mutation createUser($first_name: String!, $middle_name: String!, $last_name: String!, $phone: String!, $email: String, $password: String!) {
  insert_users_one(object: {first_name: $first_name, middle_name: $middle_name, last_name: $last_name, phone: $phone, email: $email, password: $password}) {
    id
    first_name
    middle_name
    last_name
    phone
    email
    type
  }
}`;

const getUsersByPhone = `query getUserByPhone($address: String!) {
  users(where: { phone: { _ilike: $address } }) {
    id
    first_name
    middle_name
    last_name
    password
    type
  }
}`;

const getUsersByEmail = `query getUserByEmail($address: String!) {
  users(where: {email: {_ilike: $address}}) {
    id
    first_name
    middle_name
    last_name
    password
    type
  }
}`;

const getUserById = `query getUserById($userId: uuid!) {
    user(where: { id: { _eq: $userId } }) {
      id
      role
      updated_at
    }
  }
`;

const authQueries = {
    createUser,
    getUsersByPhone,
    getUsersByEmail,
    getUserById,
};

module.exports = authQueries;