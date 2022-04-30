var mysql = require("mysql");
var util = require("util");

var pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "root",
  database: "urban",
  port: 3306,
});

pool.query = util.promisify(pool.query);

module.exports = pool;
