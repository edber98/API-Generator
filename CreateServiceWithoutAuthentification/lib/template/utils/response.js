const textReponse = require("../text-reponse")



module.exports.ServiceUnavailableResponse = function(res, message) {
    res.status(503).send({error: true, type: "unavailable",code: 503, message: message})
    res.end()
}
module.exports.ErrorInternalResponse = function(res, message) {
    res.status(500).send({error: true, type: "internal",code: 500, message: message})
    res.end()

}

module.exports.UnauthorizedResponse = function(res, message) {
    res.status(403).send({error: true, type: "unauthorized",code: 403, message: message}) 
    res.end()

}

module.exports.BadMethodsResponse = function(res, message) {
    res.status(405).send({error: true, type: "methods", code: 405, message: message})
    res.end()
}

module.exports.BadFieldsResponse = function(res, message,fields) {
    res.status(400).send({error: true, type: "fields", code: 400, message: message, fields:fields})
    res.end()
}

module.exports.CreateResponse = function(res, value) {
    res.status(201).send(value)
    res.end()

}

module.exports.GoodResponse = function(res, value) {
    res.status(200).send(value)
    res.end()

}

module.exports.NotFoundResponse = function(res,message) {
    res.status(404).send({error: true,  code: 404, type: "not-found", message: message})
    res.end()

}

module.exports.switchError = function(res, err) {
    
    switch (err["type"]) {
        case 'not-found':
            module.exports.NotFoundResponse(res, err["message"])
            break;
        case 'interne':
            module.exports.ErrorInternalResponse(res, err["message"])
            break;
        case 'validator':
            module.exports.BadFieldsResponse(res, err["message"], err["fields"])
            break;
        case 'unauthorized':
            module.exports.UnauthorizedResponse(res, err["message"] ? err["message"] : textReponse['response']['unauthorized'])
        default:
            module.exports.ErrorInternalResponse(res, err["message"] ? err["message"] : textReponse['response']['internal'])
      }
}