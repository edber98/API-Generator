const Response = require('./../utils/response')
const CheckerId = require('../lib/objectId')
const TextReponse = require ('../text-reponse')


module.exports.checkIsBody = function(req, res, next) {
    if (!req.body || Object.keys(req.body).length == 0 ) {
        Response.BadFieldsResponse(res, TextReponse['response']['body_empty'], {})
    }
    else
        next();
}


  module.exports.checkIsParamsIsObjectId = (...idElement) => ( req, res, next) => {
    if (idElement && idElement.length > 0) {
        for (var i = 0; i < idElement.length; i++) {
            if (!CheckerId.checkObjectId(req.params[idElement[i]])) {
                return Response.BadFieldsResponse(res, TextReponse['response']['invalid_id'])
            }
        }
    }
    else
        Response.BadFieldsResponse(res, TextReponse['response']['invalid_params'])
    next();
  }

  module.exports.checkIsQuery = (...idElement) => ( req, res, next) => {
    if (idElement && idElement.length > 0) {
        for (var i = 0; i < idElement.length; i++) {
            if (!req.query[idElement[i]]) {
                return Response.BadFieldsResponse(res, TextReponse['response']['invalid_query'])
            }
        }
    }
    else
        Response.BadFieldsResponse(res, TextReponse['response']['error_query'])
    next();
  }

  