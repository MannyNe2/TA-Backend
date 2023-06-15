const authQueries = require("./queries");
const signedRequests = require("../requests/signedRequests");

const findUser = async(address) => {
    const variables = {
        address: address,
    };
    const type = String(address)
        .toLowerCase()
        .match(
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
    if (type === null) {
        const data = (await signedRequests.api(authQueries.getUsersByPhone, variables))
            .data;
        if (data.users.length > 0) {
            return data.users[0];
        } else {
            return false;
        }
    } else {
        const data = (await signedRequests.api(authQueries.getUsersByEmail, variables))
            .data;
        if (data.users.length > 0) {
            return data.users[0];
        } else {
            return false;
        }
    }
};

const createUser = async(
    first_name,
    middle_name,
    last_name,
    phone,
    email,
    passwordHash,
) => {
    const variables = {
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        phone: phone,
        email: email,
        password: passwordHash,
    };
    const data = (await signedRequests.api(authQueries.createUser, variables))
        .data;
    if (data.insert_users_one) {
        return data.insert_users_one;
    } else {
        return false;
    }
};

const getUserById = async(userId) => {
    const variables = {
        userId: userId,
    };
    const data = (await signedRequests.api(authQueries.getUserById, variables))
        .data;
    if (data && data.user[0]) {
        return data.user[0];
    } else {
        return false;
    }
};

module.exports = {
    findUser,
    createUser,
    getUserById,
};