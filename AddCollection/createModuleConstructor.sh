  lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4

echo "


const mongoose = require('mongoose');
const bcryptUtils = require('../utils/bcrypt');
const ${upperSin}Schema = require('../schemas/${upperSin}')
const ObjectConst = require('../lib/object')

const TextReponse = require('../text-reponse')


var ${upperSin} = module.exports = mongoose.model('${upperSin}', ${upperSin}Schema);


module.exports.createOne${upperSin} =  function(create${upperSin}, domain, callback) {
    create${upperSin}['domain'] = domain
    var new${upperSin} = new ${upperSin}(create${upperSin})

            new${upperSin}.save({ new: true }, function(err,${lowerSin}) {
                if (err)
                    callback(err)
                    else {
                        var result = ObjectConst.withoutFields([], ${lowerSin})
                        callback(null, result)
                    }
            }) 
    
}

module.exports.findOne${upperSin}AndUpdate = function(query, update,domain, callback) {
    var queryFind = {...query, ...{domain: domain}}
    update = update
    ${upperSin}.findOneAndUpdate(queryFind, update, {new: true},function(err, data) {
        if (err)
            callback(err)
        else if (!data || data == null)
            callback({type:'not-found',message: TextReponse['${lowerSin}']['not_found']})
        else {
            var result = ObjectConst.withoutFields(([]), data)
            callback(null, result)
        }
    })
}

module.exports.updateMany${upperPlu} = function(query , update,domain, callback) {
    var queryFind = {...query, ...{domain: domain}}
    module.exports.findMany(queryFind,domain, function(err, original${upperSin}) {
        if (err)
            callback(err)
        else if (original${upperSin} && original${upperSin}.length == 0)
            callback({type:'not-found', message:TextReponse['${lowerSin}']['not_found'] ,many:true})
        else {
        //    ${upperSin}Event.updateMany${upperSin}BeforeSave(original${upperSin})
            ${upperSin}.updateMany(queryFind,update, function(err, data) {
                if (err)
                    callback(err)
                else {
                    module.exports.findMany(queryFind,domain, function(err, data) {
                        if (err) 
                            callback(err)
                        else {
             //               ${upperSin}Event.updateMany${upperSin}AfterSave(data)
                            callback(null, data)
                        }
                    })
                }
            })
        }
    })
}

module.exports.findOne${upperSin} = function(query ,populate, domain,  callback) {
    var queryFind = {...query, ...{domain: domain}}
    var filterPrint = {}
    if (populate)
        ${upperSin}.findOne(queryFind,filterPrint).populate('permissions').exec(callback)
    else
    ${upperSin}.findOne(queryFind,filterPrint, callback)
}

module.exports.deleteMany${upperPlu} = function(query, domain, callback) {
    module.exports.findMany(query, domain, function(err, original${upperSin}) {
        if (err)
        callback(err)
        else if (original${upperSin} && original${upperSin}.length == 0)
            callback({type:'not-found', message:TextReponse['${lowerSin}']['not_found'], many:true})
        else {
            ${upperSin}.deleteMany(query, function(err, data) {
                if (err) 
                callback(err)
                else {
                    callback(null, original${upperSin})
                }
            })
        }
    })
}

module.exports.findMany = function(query ,domain, callback) {
    var queryFind = {...query, ...{domain: domain}}
    ${upperSin}.find(queryFind,{} ,callback)
}

module.exports.distinctMultipleFields = async function(element, domain, callback) {
    var object = {}

    for (var i = 0; i < element.length; i++) {
        var res = null;
        res =  await ${upperSin}.distinct(element[i], {domain: domain})

            object[element[i]] = res && res[0] != null ? res: []
      };
      callback(null, object)

}


module.exports.findManyWithFilter = function(filter,domain, callback) {
    ${upperSin}.aggregate([
    {
        '\$match': {...filter.match, ...{domain: domain}}
    },
    {
        '\$sort': 
          filter.sort
      },
      {
        '\$lookup': {
          'from': 'permissions', 
          'localField': 'permissions', 
          'foreignField': '_id', 
          'as': 'permissions'
        }
      },
    {
    '\$group': {
      '_id': null, 
      'content': {
        '\$push': '\$\$ROOT'
      }, 
      'count': {
        '\$sum': 1
      }
    }
  }, {
    '\$project': {
      'count': 1, 
      'content': {
        '\$slice': [
          '\$content', ((Number(filter.pageIndex) - 1) * Number(filter.pageSize)), Number(filter.pageSize)
        ]
      }
    }
  },
    ], function(err, data) {
        if (err) {
            callback(err)
        }
        else  {
                var result = data[0]
                callback(null, result)
            
        }
    })
}

"