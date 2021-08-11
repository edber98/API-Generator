const ConfigFile = require("./../config")


const mongoose = require('mongoose');

/* INIT DATABASE EVENT */
const DatabaseEvent = require('./../events/DatabaseEvent')
DatabaseEvent.initEvent()


mongoose.connect(ConfigFile["database"]["url"] + ConfigFile["database"]["name_database"], {
    useCreateIndex: true,
    useUnifiedTopology: true,
    useNewUrlParser: true,
    useFindAndModify:false
}).then(
    async(res) => {
//        console.log("Base de donnees: OK");
    }).catch(() => {
 //   console.log("Base de donnees: KO");
});