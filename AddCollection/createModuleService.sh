  lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4

echo "

const ${upperSin}Constructor = require('../constructors/${upperSin}Constructor')
const Parser = require('./../lib/parser')
const TextResponse = require('../text-reponse')

module.exports.createOne${upperSin} = function(${lowerSin},domain,  callback) {
    ${upperSin}Constructor.createOne${upperSin}(${lowerSin},domain,  function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
        }
    })
}




module.exports.findManyById = function(permissions,domain, callback) {
    var query = {_id:{\$in: permissions}}
    ${upperSin}Constructor.findMany(query, domain, function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
        }
    })
}

module.exports.findOneById = function(id, populate,domain, callback) {
    var query = {_id: id}
    ${upperSin}Constructor.findOne${upperSin}(query,populate, domain, function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
        }
    })
}

module.exports.findOne${upperSin}ByIdAndUpdate = function(id,update,domain, callback) {
    var query = {_id: id}
    var update = {\$set: {...update, ...{updated_at: Date.now()}}}
    ${upperSin}Constructor.findOne${upperSin}AndUpdate(query, update,domain, function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
        }
    })
}





module.exports.deleteMany${upperPlu} =  function(${lowerSin}Id,domain, callback) {
    var query = {_id:{\$in: ${lowerSin}Id}}
    ${upperSin}Constructor.deleteMany${upperPlu}(query, domain, function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
     
        }
    })
}


module.exports.findManyWithFilter = function(filter, domain, callback) {
    ${upperSin}Constructor.findManyWithFilter(filter,domain, function(err, data) {
        if (err) {
            var newErr = Parser.parserErrorFromService(err)
            callback(newErr)
        }
        else {
            callback(null, data)
        }
    })
}

"