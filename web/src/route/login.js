import passport from "passport";

let get_login_page = (req, res) => {
    return res.render("login.ejs");
};

let handle_login = (req, res, next) => {
    passport.authenticate("localLogin", function (error, user, info) {
        if (error) {
            return res.status(500).json(error);
        }
        if (!user) {
            return res.status(401).json(info.message);
        }
        req.login(user, function (err) {
            if (err) {
                return res.status(500).json(error);
            } else {
                return res.status(200).json(user);
            }
        });
    })(req, res, next);
};

let check_logged_in = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return res.redirect("/login");
    }
    next();
};

let check_logged_out = (req, res, next) => {
    if (req.isAuthenticated()) {
        return res.redirect("/");
    }
    next();
};

let post_logout = (req, res) => {
    req.session.destroy(function (err) {
        return res.redirect("/login");
    });
};

module.exports = {
    login_page: get_login_page,
    handle_login: handle_login,
    check_logged_in: check_logged_in,
    check_logged_out: check_logged_out,
    post_log_out: post_logout,
};