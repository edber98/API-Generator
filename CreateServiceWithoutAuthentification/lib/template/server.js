const ConfigFile = require("./config")
const TextReponse = require("./text-reponse")


/* Création du serveur en utilisant express */
const express = require('express');
const app = express();
const http = require('http').Server(app);

/* parsing des donnees recus et HEADER request */
require('./utils/body-parser')(app);

/* Init la base de donnée MONGODB */
require('./utils/database');

/* INIT DU LOGGER */
const Logger = require('./utils/logger');



/*********************************************************************************/


/*****************************/
/*        MIDDLEWARE         */
/*****************************/

//  -- ROUTING BALISE -- //     NE PAS EFFACER

const DatabaseMiddleware = require('./middlewares/DatabaseMiddleware')
const CheckerMiddleware = require('./middlewares/CheckerMiddleware')



//---EP_MIDDLEWARE_END // -- MIDDLEWARE FIN -- //     NE PAS EFFACER

/*********************************************************************************/


/******************************/
/*  DECLARATION - CONTROLLER  */
/******************************/

//  -- ROUTING BALISE -- //     NE PAS EFFACER
//EXEMPLE --->  var UserController = require('./controllers/UserController')



//---EP_RIMPORT_END // -- ROUTING FIN -- //     NE PAS EFFACER


/*********************************************************************************/


/******************************/
/*     ROUTE - CONTROLLER     */
/******************************/


//  -- ROUTING BALISE -- //     NE PAS EFFACER
// EXEMPLE --->     app.post('/user/login', DatabaseMiddleware.checkDatabase, UserController.UserLogin)




//---EP_R_END // -- ROUTING FIN -- //     NE PAS EFFACER


/*********************************************************************************/


/* Ecoute du serveur sur le port selectionner */
const server = http.listen(ConfigFile['port_listen'], function() {
    Logger.logChildModule('express', 'info', TextReponse['express'])
});

module.exports = server
