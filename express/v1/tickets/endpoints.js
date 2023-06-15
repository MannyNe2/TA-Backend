const { bookData } = require("./helpers");
const { verifyAction } = require("../globalHelpers");

/**
 * Sign in endpoint
 * Default Url = {root}/auth/login
 * ---------------------------------------------------------------------
 * Authentication endpoint for the signIn action
 *
 * Checks if a user with credentials matching those in the request exists
 * If a user is found, an accessToken is generated with the appropriate
 * roles and returned in the response along with other required data
 * If no user is found, or the credentials are incorrect, an error message
 * is returned.
 * 
 *  THIS WILL RETURN A TICKET NUMBER AND STORE THE DATA TO THE TABLE
 */
const ticketBought = async(req, res) => {
    verifyAction(req, res, async(req, res) => {
        const { userId, userPhone, ticketId, providerName } = req.body.input;
        let ticketNumber = "";

        try {
            // CREATING RANDOM CHARACTERS
            let characters =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            let charactersLength = characters.length;
            for (let i = 0; i < 6; i++) {
                ticketNumber += characters.charAt(Math.floor(Math.random() * charactersLength));
            }

            let bookedData = await bookData(
                userId,
                userPhone,
                ticketId,
                ticketNumber,
                providerName
            );

            console.log(bookedData)
            if (bookedData) {
                res.status(200).json({
                    ticketNumber: bookedData.ticket_number,
                });
            } else {
                res.status(401).json({
                    message: "Ticket number generation failed, please try again.",
                });
            }
        } catch (err) {
            res.status(400).json({
                message: "Invalid input. Please try again with a valid request body",
            });
        }
    });
};

const endpoints = {
    ticketBought,
};

module.exports = endpoints;