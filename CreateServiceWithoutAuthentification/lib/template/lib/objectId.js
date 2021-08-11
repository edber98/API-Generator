var ObjectID = require('mongoose').Types.ObjectId;


module.exports.checkObjectId = function(id) {
    if (ObjectID.isValid(id) && new ObjectID(id) == id) {
        return true
    } 
    else {
        return false
    }
}

module.exports.checkObjectIdAndReturn = function(id) {
    if (ObjectID.isValid(id) && new ObjectID(id) == id) {
        return new ObjectID(id) 
    } 
    else {
        return false
    }
}


module.exports.checkObjectIdTab = function(table) {
    for (var i = 0; i < table.length; i++) {
        if (!module.exports.checkObjectId(table[i])) {
            return false
        }
    }
    return true
}