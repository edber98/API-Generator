var ObjectID = require('mongoose').Types.ObjectId;


module.exports.TransObjectElementInArrayToArray = function(element, tab) {
    var result = []
    if (tab && tab.length)
    for (var i = 0; i < tab.length; i++) {
        result.push(tab[i][element])
    }
    return result
}


module.exports.findMatchesInArray = function(tabToFind, ToFind) {
    for (var i = 0; i < ToFind.length; i++) {
        if (tabToFind.indexOf(ToFind[i])>-1) {
            return true
        }
    }
    return false
}


module.exports.TransObjectElementInMergeArrayToArray = function(element, tab) {
    var result = []
    if (tab && tab.length)
    for (var i = 0; i < tab.length; i++) {
        result = [...result, ...tab[i][element]]
    }
    return result
}

module.exports.TransArrayToArrayObjectId = function( tab) {
    var result = []
    if (tab && tab.length)
    for (var i = 0; i < tab.length; i++) {
        result.push(new ObjectID(tab[i]))
    }
    return result
}