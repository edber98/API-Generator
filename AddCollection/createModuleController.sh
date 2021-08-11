  lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4

echo "

const configFile = require('../config')
const Response = require('../utils/response')
const ${upperSin}Service = require ('../services/${upperSin}Service')
const Logger = require('../utils/logger');
const passport = require('passport');
const Parser = require('../lib/parser')
const Checker = require('../lib/objectId')
const TextReponse = require('../text-reponse')
const Array = require('../lib/array')

module.exports.createOne${upperSin} = function(req, res) {
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])
    Logger.logChildModule('http', 'info', TextReponse['${lowerSin}']['add_${lowerSin}'])
    ${upperSin}Service.createOne${upperSin}(req.body, domain, function(err, data) {
        if (err) {
            Logger.logChildModule('${lowerSin}', 'error', TextReponse['${lowerSin}']['cant_add_${lowerSin}'])
            Response.switchError(res,err)
        }
        else {
            Logger.logChildModule('${lowerSin}', 'info',  \`\${TextReponse['${lowerSin}']['add']} \${data.name} \${TextReponse['success']}.\`)
            Response.CreateResponse(res, data)
        }
    })
}



module.exports.findOneById = function(req, res) {
    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}']} : \${req.params._id}.\`)
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])
    ${upperSin}Service.findOneById(req.params._id, (req.query.populate || false ),domain, function(err, data) {
        if (err) {
            Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}']} : \${req.params._id} \${TextReponse['fail']}.\`)
            Response.switchError(res,err)
        }
        else if (data) {
            Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}']} : '\${data.name}' \${TextReponse['success']}.\`)
            Response.GoodResponse(res, data)
        }
        else {
            Logger.logChildModule('http', 'error', TextReponse['${lowerSin}']['not_found'])
            Response.switchError(res,{type: 'not-found', message: TextReponse['${lowerSin}']['not_found']})
        }
    })
}

module.exports.findOneByIdAndUpdate = function(req, res) {
    var authFields = ['name', 'description', 'service', 'action']

    // DROIT DE MODIFIER PLUS
   /* if (req.permissions['isAdmin'] || (req['permissions']['content'].indexOf('addPermissionsTo${upperPlu}') > -1 && req['permissions']['content'].indexOf('deletePermissionsTo${upperPlu}') > -1))
    authFields = [...authFields, ...['permissions', 'isAdmin']]
    if (req.${lowerPlu}['isAdmin'] || (req.${lowerPlu}.keyIdTab.indexOf('add${upperSin}To${upperSin}') > -1 && req.${lowerPlu}.keyIdTab.indexOf('delete${upperSin}To${upperSin}') > -1))
        authFields = [...authFields, ...['${lowerPlu}']]*/
     
        var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])

    var update = Parser.parserObjectWithOnlyFields(req.body, authFields)
    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_edit']}: \${req.params._id}.\`)
    ${upperSin}Service.findOne${upperSin}ByIdAndUpdate(Checker.checkObjectIdAndReturn(req.params._id),update, domain, function(err, data) {
        if (err) {
            Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_edit']} : \${req.params._id} \${TextReponse['fail']}.\`)
            Response.switchError(res,err)
        }
        else {
            Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_edit']} : \${req.params._id} \${TextReponse['success']}.\`)
            Response.GoodResponse(res, data)
        }
    })
}

module.exports.deleteOne${upperSin} = function(req, res) {
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])
    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_delete_one']} : \${req.params._id}.\`)
    ${upperSin}Service.deleteMany${upperPlu}([req['params']['_id']], domain,function(err, data) {
        if (err) {
            Response.switchError(res,err)
            Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_delete_fail']} : \${req.params._id}.\`)
        }
            else {
                Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_delete_one']} : \${req.params._id} \${TextReponse['success']}.\`)
                Response.GoodResponse(res, data[0])
            }
    }) 
}

module.exports.deleteMany${upperPlu} = function(req, res) {
    var filter = Parser.parserQueryJSONElement(req.query, '_id')
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])

    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_delete_multiple']} : \${req.params._id}.\`)
    if (filter['_id'] && filter['_id'].length > 0 && Checker.checkObjectIdTab(filter['_id']))
        ${upperSin}Service.deleteMany${upperPlu}(filter['_id'], domain,function(err, data) {
            if (err) {
                Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_delete_multiple_fail']} : \${req.params._id}.\`)
                Response.switchError(res,err)
               }   else {
                Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_delete_multiple']} : \${req.params._id} \${TextReponse['success']}.\`)

                Response.GoodResponse(res, data)  
               } 
        })
    else  {
        Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_delete_multiple']} : \${req.params._id} \${ TextReponse['response']['result_to_bad_query']}.\`)
        Response.BadFieldsResponse(res, TextReponse['response']['bad_query'],  {_id: TextReponse['response']['bad_fields']})
    }
}

/*
module.exports.distinctMultipleFields = function(req, res) {
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])
    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_fields_common']}.\`)
    ${upperSin}Service.distinctMultipleFields(['element', 'service', 'action', 'subElement'],domain, function(err, data) {
        if (err) {
            Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_get_fields_common_fail']}.\`)

        Response.switchError(res,err)
        }
    else {
        Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_fields_common']} \${ TextReponse['response']['result_to_bad_query']}.\`)
        Response.GoodResponse(res, data)
    }
    })
}
*/

module.exports.findMany${upperSin} = function(req, res) {
    Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}_multiple']}.\`)
    var findQuery = Parser.parserQueryForFindWithFilter(req.query, [], ['name', 'keyId','updated_at'], 'name')
    var domain = configFile['test_mode'] ? configFile['domain_test'] : (req.query.domain || configFile['domain'])

    ${upperSin}Service.findManyWithFilter(findQuery, domain,function(err, data) {
        if (err) {
            Logger.logChildModule('http', 'error', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}_multiple_fail']}.\`)
            Response.switchError(res,err)
        }
        else {
            Logger.logChildModule('http', 'info', \`\${TextReponse['${lowerSin}']['tentative_get_${lowerSin}_multiple']} \${TextReponse['success']}.\`)
            Response.GoodResponse(res, data)
        }
    })
}

"