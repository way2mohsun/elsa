require('dotenv').config();
import express from "express";
import initWebRoutes from "./route";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import session from "express-session";
import passport from "passport";

let app = express();

app.use(cookieParser("secret"));

//config session
app.use(session({
   secret: 'secret',
   resave: true,
   saveUninitialized: false,
   cookie: {
      maxAge: 1000 * 60 * 60 * 24 // 86400000 1 day
   }
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