const fs = require('fs');
const path = require('path');

const sql = fs.readFileSync(path.resolve(__dirname, '../init.sql'), 'utf-8');

const { Sequelize } = require("sequelize");
const config = require("./config")[process.env.NODE_ENV || "development"];

const sequelize = new Sequelize(
  config.database,
  config.username,
  config.password,
  {
    host: config.host,
    dialect: config.dialect,
    logging: false, // Disable query logs in the console
  }
);

module.exports = sequelize;
