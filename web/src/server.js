require('dotenv').config();
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import express from "express";
import passport from "passport";
import session from "express-session";
var FileStore = require('session-file-store')(session);

import initWebRoutes from "./route";

let app = express();

app.use(cookieParser("secret"));

//config session
app.use(session({
   resave: true,
   saveUninitialized: true,
   secret: 'uwotm8',
   cookie: {
      maxAge: 1000 * 60 * 30,
      originalMaxAge: 1000 * 60 * 30 * 3
   },
   store: new FileStore({
      path: __dirname + '/sessions',
      useAsync: true,
      reapInterval: 3000,
      maxAge: 1000 * 60 * 30 * 3
   }),
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// config view engine
app.use(express.static(__dirname + '/public'));
app.use("/bootstrap", express.static(__dirname + '/public/bootstrap-4.3.1'));
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