const gtfs = require('gtfs');
const mongoose = require('mongoose');

// https://www.npmjs.com/package/gtfs#gtfs-import-script

const config = {
    mongoUrl: 'mongodb://localhost:27017/gtfs',
    agencies: [
      {
        agency_key: 'sptrans',
        "path": "src/scripts/gtfs.zip"
      }
    ],
    logFunction: function(text) {
      console.log(text);
    }
  };

mongoose.connect(config.mongoUrl, {useNewUrlParser: true});

gtfs.import(config)
.then(() => {
  console.log('Import Successful');
  return mongoose.connection.close();
})
.catch(err => {
  console.error(err);
});