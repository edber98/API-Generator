const winston = require('winston');
const ConfigFile = require("../config")

var Logger

/* INIT DU SYSTEME DE LOGGER */
var init = function() {
    const logger = winston.createLogger({
        level: 'info',
        format: winston.format.json(),
        defaultMeta: { service: 'keybns' },
        transports: [
            new winston.transports.File({ filename: 'logs/error.log', level: 'error' }),
            new winston.transports.File({ filename: 'logs/combined.log' }),
        ],
    });
    if (ConfigFile['mode_dev'] && !ConfigFile['test_mode'] ) {
        logger.add(new winston.transports.Console({
            format: winston.format.simple(),
        }));
    }
    return logger


}


module.exports.logChildModule = function(child, type, message) {
    if (!Logger)
        Logger = init()
    const childLogger = Logger.child({ module: child });
    childLogger[type](message);

}


module.exports.logChildElement = function(element, childId, type, message) {  
    if (!Logger)
        Logger = init()
    const childLogger = Logger.child({ [element]: childId });
    childLogger[type](message);
}