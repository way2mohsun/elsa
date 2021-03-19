import express from "express";
import registerController from "./route/register-new-user";
import loginController from "./route/login";
import home_page_controller from "./route/home-page";
import init_passport_local from "./route/passport-local";
import forgetPasswordController from "./route/forget-password";
import resetPass from "./route/reset-pass"
//
init_passport_local();

let router = express.Router();

let initWebRoutes = (app) => {
    router.get("/tst", home_page_controller.tst);

    router.get("/", loginController.check_logged_in, home_page_controller.home_page);
    router.post("/", loginController.check_logged_in, home_page_controller.init_home_page);


    router.get("/register", registerController.register_page);
    router.post("/register-new-user", registerController.create_new_username);

    router.get("/login", loginController.check_logged_out, loginController.login_page);
    router.post("/login", loginController.handle_login);
    router.post("/logout", loginController.post_log_out);

    router.get("/forget-pass", forgetPasswordController.get_forget_pass_page);
    router.post("/forget-pass", forgetPasswordController.send_forget_password_link);

    router.get("/reset-pass", resetPass.reset_pass_page);
    router.post("/reset-pass", resetPass.set_new_pass);

    return app.use("/", router);
};

module.exports = initWebRoutes;
//forever start -c "node -r babel-node" src/server.js
//node -r babel - node src/server.js