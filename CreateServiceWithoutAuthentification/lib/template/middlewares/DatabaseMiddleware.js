const DatabaseEvent = require('./../events/DatabaseEvent')
const Response = require('./../utils/response')

module.exports.checkDatabase = function(req, res, next) {
    if (!DatabaseEvent.listen()) {
        var dbStatus = DatabaseEvent.returnStatus()
        Response.ErrorInternalResponse(res, dbStatus["status"])
    }
    else
        next();
  }