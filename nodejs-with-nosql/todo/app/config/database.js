const databaseHost = process.env.DATABASE_HOST;
const databasePort = process.env.DATABASE_PORT;
const databaseUser = process.env.DATABASE_USER;
const databasePassword = process.env.DATABASE_PASSWORD;
const databaseName = process.env.DATABASE_NAME;
const databaseConnectionOpts = process.env.DATABASE_CONNECTION_OPTIONS;

module.exports = {
  // Examples of valid connection strings.
  //remoteUrl : 'mongodb://todo:bitnami@mongodb-primary:27017/todo',
  //remoteUrl : 'mongodb://0eb6bfe9-0ee0-4-231-b9ee:PpqNdxdyyys5nnQNA6SmPatk4NGkPlkLpUeqYz33ikQKTNDy4cma42500PCpt8S0GF9qm0hzv0R0FKglK3v03g==@0eb6bfe9-0ee0-4-231-b9ee.documents.azure.com:10255/?ssl=true',
  remoteUrl : `mongodb://${databaseUser}:${databasePassword}@${databaseHost}:${databasePort}/${databaseName}?${databaseConnectionOpts}`,
  localUrl: 'mongodb://localhost/meanstacktutorials'
};
