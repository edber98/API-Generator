const mongoose = require('mongoose');
const Array = require('../lib/array')
const CheckerId = require('../lib/objectId')
const TextReponse = require('../text-reponse')

module.exports.parserErrorFromService = function(err) {
    if (err instanceof mongoose.Error.ValidationError) {
        var res = {type: "validator", message: TextReponse['mongodb']['bad_format'],fields:{}}
        var fields = {}
        Object.keys(err.errors).map((value) => {
            fields[value] = err.errors[value]["properties"]["message"]
        })
        res["fields"] = fields
        return res
    }
    else if (err instanceof mongoose.Error.DocumentNotFoundError) {
        return {type: "not-found", message: TextReponse['mongodb']['not_found']}
    }
    else if (err instanceof mongoose.Error) {
        return {type: "interne", message: TextReponse['mongodb']['error_query']}
    }
    else if (err) {
        return parseOtherField(err)
    }
    return null
}

parseOtherField = function(err) {
    if(err["driver"] && err["code"] == 11000) {
        var fields = {}
        Object.keys(err["keyValue"]).map((val) => {
            fields[val] = `${err["keyValue"][val]} ${TextReponse['mongodb']['is_used']}.` 
        })
        return {type: "validator", message:  TextReponse['mongodb']['not_unique'], fields:fields}
    }
    else if (err["type"] && err["type"] == 'not-found')
        return {type: "not-found", message: err["message"] ? err["message"] : err["many"] ? TextReponse['mongodb']['not_found_many']: TextReponse['mongodb']['not_found']}
    else if (err["type"] && err["type"] == 'validator')
        return {type: "validator", message: err["message"] ? err["message"] :  TextReponse['mongodb']['bad_format'], fields:  err["fields"] ? err["fields"] : {}}
    return {type: "interne", message: err["message"] ? err["message"] :  TextReponse['mongodb']['internal']}

}

module.exports.parserQueryJSONElement = function(query,  ...keys) {
    var object = {}
    keys.forEach((value) => {
        var tmp = this.tryCatchJSON(query[value])
        
        if (tmp)
            object[value] = tmp
        else
            return false
    })
    return object
}

module.exports.parserObjectWithOnlyFields = function(object, fields) {
    var res = {}
    Object.keys(object).map((value) =>{
        if (fields.indexOf(value) > -1)
            res[value] = object[value]
    })
    return res
}

module.exports.tryCatchJSON = function(obj) {
    try {
        return JSON.parse(obj);
    } catch (err) {
        return false;
    }
}

module.exports.parserQueryForFindWithFilter = function(query, fieldFilterAuth, fieldSortAuth, sortDefault) {
    var queryFinal = {}
    var filterFinal = {}
    var res = query['_id'] ? module.exports.tryCatchJSON(query['_id']): false
    if (res)
        queryFinal = {_id:{"$in": CheckerId.checkObjectIdTab(res) ? Array.TransArrayToArrayObjectId(res): []}}
    var resFilter = query['filter'] ? module.exports.tryCatchJSON(query['filter']): false
    if (resFilter)
        Object.keys(resFilter).map((value) => {
            if (fieldFilterAuth.indexOf(value) > -1)
                queryFinal[value] = {"$in": resFilter[value]}
    }) 
    filterFinal['pageIndex'] = query['pageIndex'] ? query['pageIndex']: 1
    filterFinal['pageSize']= query['pageSize'] ? query['pageSize']: 1
    filterFinal['sort'] = query['sortField'] && fieldSortAuth.indexOf(query['sortField']) > -1 ? {[query['sortField']]:  query['sortOrder'] ? Number(query['sortOrder']) : -1 }: {[sortDefault]:1}
    filterFinal['match'] = queryFinal
    return filterFinal
}