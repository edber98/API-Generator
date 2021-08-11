module.exports.withoutFields = function(fields, value) {
    var object = value.toObject() ?  value.toObject() : value;
    (Object.keys(object)).map((label)=> {
        if (fields.indexOf(label) > -1) {

            delete object[label]

        }
    })
    return object
}