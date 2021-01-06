import connection from "../config/database-connect";
import bcrypt from "bcryptjs";

let create_new_user = (user) => {
    return new Promise(async (resolve, reject) => {
        try {
            let salt = bcrypt.genSaltSync(10);
            let data = {
                fname: user.fname,
                phone: user.phone,
                email: user.email,
                password: bcrypt.hashSync(user.password, salt)
            };
            //create a new user
            connection.query("INSERT INTO user set ? ", data, function (error, rows) {
                if (error) reject(error);
                resolve("create a new user successfully");
            })
        } catch (e) {
            console.log(e)
            reject(e);
        }
    });
};

let check_user_mail = (email) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from user where email = ?", email, function (error, rows) {
                if (error) reject(true);
                if (rows.length > 0) resolve(true);
                resolve(false);
            })
        } catch (e) {
            console.log(e);
            resolve(true);
        }
    });
};

let criteria = () => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from password_criteria ", function (error, rows) {
                if (error) reject(error);
                let result = {};
                for (var row of rows) {
                    result[row.type] = {
                        message: row.message,
                        rule: row.rule,
                        must: row.kind === 'must',
                        must_not: row.kind === 'must-not',
                    };
                }
                resolve(result);
            });
        } catch (e) {
            console.log(e)
            reject(e);
        }
    });
}

module.exports = {
    create_new_user: create_new_user,
    check_user_mail: check_user_mail,
    criteria: criteria,
};