require('dotenv').config();
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import express from "express";
import passport from "passport";
import session from "express-session";
import initWebRoutes from "./route";
import redis from "redis";
var client = redis.createClient();
var redisStore = require('connect-redis')(session);
let app = express();

app.use(cookieParser("uwotm8"));

//config session
app.use(session({
   resave: true,
   saveUninitialized: true,
   secret: 'uwotm8',
   cookie: {
      maxAge: 1000 * 60 * 30 * 60,
      originalMaxAge: 1000 * 60 * 30 * 3
   },
   store: new redisStore({
      host: process.env.R_IP,
      port: process.env.R_PORT,
      client: client, ttl: 260,
   }),
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// config view engine
app.use(express.static(__dirname + '/public'));
app.use("/bootstrap", express.static(__dirname + '/public/bootstrap-5.0.0'));
app.set("view engine", "ejs");
app.set("views", "./src/views");

//Config passport middleware
app.use(passport.initialize());
app.use(passport.session());

//init all web routes
initWebRoutes(app);

let port = process.env.app_port || 8080;

app.listen(port, () => {
   console.log(`App is running at the ${port}`);
});
////sudo forever start -c node_modules/.bin/babel-node src/server.js