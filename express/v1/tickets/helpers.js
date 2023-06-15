const { addTicket } = require("./queries");
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
        const data = (
            await signedRequests.api(authQueries.getUsersByPhone, variables)
        ).data;
        if (data.users.length > 0) {
            return data.users[0];
        } else {
            return false;
        }
    } else {
        const data = (
            await signedRequests.api(authQueries.getUsersByEmail, variables)
        ).data;
        if (data.users.length > 0) {
            return data.users[0];
        } else {
            return false;
        }
    }
};

// ADD A PROVIDER TO THE VARIABLES
const bookData = async(
    userId,
    userPhone,
    ticketId,
    ticketNumber,
    providerName
) => {
    const variables = {
        user_id: userId,
        user_phone: userPhone,
        ticket_id: ticketId,
        ticket_number: ticketNumber,
    };
    const data = (await signedRequests.api(addTicket(providerName), variables))
        .data;
    console.log(data);
    if (data.ticketData) {
        console.log("returneeedd");
        return data.ticketData;
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
    bookData,
    getUserById,
};