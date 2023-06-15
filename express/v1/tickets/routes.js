const endpoints = require('./endpoints');

const initAuthRoutes = (app, endpointRoot) => {
    const authRoot = `${endpointRoot}/tickets`;
    app.post(`${authRoot}/ticketBought`, endpoints.ticketBought);
};

module.exports = initAuthRoutes;