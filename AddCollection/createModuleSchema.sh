  lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4

echo "
const mongoose = require('mongoose');
const TextReponse = require('../text-reponse')


const ${upperSin}Schema = mongoose.Schema({
    active: {
        type: Boolean,
        default: true,
        required: true
    },
    created_at: { 
        type: Date,
         required: true,
         default: Date.now,
        },
    updated_at: { 
        type: Date,
        required: true,
        default: Date.now,
    },


});

var ${upperSin} = module.exports = ${upperSin}Schema
"