require("dotenv").config();
import mysql from "mysql2";

let connection = mysql.createConnection({
    host: process.env.db_host,
    port: process.env.db_port,
    database: process.env.db_name,
    user: process.env.db_username,
    password: process.env.db_password,
});

connection.on('error', function (err) {
    console.log("I'm dead, please setup the env file for connecting to your database! => no connection to your DB");
    console.log(err);
})

module.exports = connection;