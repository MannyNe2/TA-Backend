const endpointRoot = '/v1';
const initAuthRoutes = require('./auth/routes');
const initTicketsRoutes = require('./tickets/routes');

const initRoutes_v1 = (app) => {
    initAuthRoutes(app, endpointRoot);
    initTicketsRoutes(app, endpointRoot);
};

module.exports = initRoutes_v1;