const bodyParser = require('body-parser');
const cors = require('cors');


/* parsing des donnees recus et HEADER request */
module.exports = function(app) {
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(cors());
}