
const mongoose = require("mongoose")
var Logger = require('../utils/logger')
const TextReponse = require("../text-reponse")


var mongodbStatus = {connected: false, status: TextReponse['mongodb']['not_init']  };

module.exports.listen = function() {
    return mongodbStatus['connected']
}

module.exports.returnStatus = function() {
    return mongodbStatus
}

module.exports.initEvent = function() {
    var db = mongoose.connection;
    db.on('open', function (ref) {
        connected = true;
        mongodbStatus['status'] = TextReponse['mongodb']['open']
        Logger.logChildModule('mongodb', 'info', mongodbStatus['status'])
    });

    db.on('connected', function (ref) {
        global.mongo_conn=true;
        mongodbStatus['status'] = TextReponse['mongodb']['connect']
        mongodbStatus['connected'] = true
        Logger.logChildModule('mongodb', 'info', mongodbStatus['status'])

    });

    db.on('disconnected', function (ref) {
        mongodbStatus['status'] = TextReponse['mongodb']['disconnect']
        mongodbStatus['connected'] = false
        Logger.logChildModule('mongodb', 'warn', mongodbStatus['status'])

    });

    db.on('disconnect', function (err) {
        mongodbStatus['status'] = TextReponse['mongodb']['error_disconnect']
        Logger.logChildModule('mongodb', 'error', mongodbStatus['status'])

    });

    db.on('connecting', function (ref) {
        mongodbStatus['status'] = TextReponse['mongodb']['connection']
        Logger.logChildModule('mongodb', 'info', mongodbStatus['status'])
    });

    db.on('close', function (ref) {
        global.mongo_conn=false;
        mongodbStatus['connected'] = false
        mongodbStatus['status'] = TextReponse['mongodb']['close']
        Logger.logChildModule('mongodb', 'info', mongodbStatus['status'])
    });

    db.on('error', function (ref) {
        mongodbStatus['connected'] = false
        mongodbStatus['status'] = TextReponse['mongodb']['error']
        global.mongo_conn=false;
        Logger.logChildModule('mongodb', 'error', mongodbStatus['status'])

    });

    db.on('reconnected', function () {
        global.mongo_conn=true;
        mongodbStatus['connected'] = true
        mongodbStatus['status'] = TextReponse['mongodb']['reconnected']
        Logger.logChildModule('mongodb', 'info', mongodbStatus['status'])

    });

    db.on('reconnecting', function () {
        global.mongo_conn=true;
        mongodbStatus['connected'] = true
        mongodbStatus['status'] = TextReponse['mongodb']['reconnection']
        Logger.logChildModule('mongodb', 'warn', mongodbStatus['status'])
    });
}