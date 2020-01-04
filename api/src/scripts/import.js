const gtfs = require('gtfs');
const mongoose = require('mongoose');

const config = {
    mongoUrl: 'mongodb://localhost:27017/gtfs',
    agencies: [
      {
        agency_key: 'sptrans',
        "path": "src/scripts/gtfs.zip"
      }
    ],
    logFunction: function(text) {
      // Do something with the logs here, like save it or send it somewhere
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