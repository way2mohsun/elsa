import passport from "passport";
import passportLocal from "passport-local";
import loginService from "../services/login";

let LocalStrategy = passportLocal.Strategy;

let init_passport_local = () => {
    passport.use("localLogin", new LocalStrategy({
        usernameField: 'email',
        passwordField: 'password',
    },
        async (email, password, done) => {
            try {
                await loginService.find_by_email(email).then(async (user) => {
                    if (!user) return done(null, false, { message: `This user email "${email}" doesn't exist` })
                    if (user) {
                        //compare password
                        let match = await loginService.compare_user_password(user, password);
                        if (match === true) return done(null, user, null);
                        return done(null, false, { message: match });
                    }
                });

            } catch (err) {
                console.log(err)
                return done(null, false, { message: err });
            }
        }));
};

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser((id, done) => {
    loginService.find_user_by_id(id).then((user) => {
        return done(null, user);
    }).catch(error => {
        return done(error, null)
    });
});

module.exports = init_passport_local;