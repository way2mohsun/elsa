import bcrypt from "bcryptjs";

import connection from "../config/database-connect";

let set_token = (email, token) => {
    return new Promise((resolve, rejects) => {
        try {
            connection.query("update user set token = ? where email = ? ", [token, email],
                function (error, rows) {
                    if (error) reject(error);
                    resolve(true);
                });
        } catch (e) {
            console.log(e)
            reject(error);
        }
    });
}

let find_token = (token, email) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from user where token = ? and email = ?", [token, email], function (error, rows) {
                if (error) reject(error);
                if (rows.length > 0) resolve(true);
                resolve(false);
            })
        } catch (e) {
            console.log(e)
            reject(e);
        }
    });
};

let set_new_password = (email, pass, token) => {
    return new Promise((resolve, reject) => {
        try {
            let salt = bcrypt.genSaltSync(10);
            let password = bcrypt.hashSync(pass, salt);
            console.log(password)
            console.log(email)
            console.log(pass)
            console.log(token)
            connection.query("update user set password=?,token=null where email=? and token =?",
                [password, email, token],
                function (error, rows) {
                    if (error) {
                        console.log(error)
                        reject(error);
                    }
                    console.log(rows)
                    resolve(true);
                });
        } catch (e) {
            console.log(e)
            reject(e);
        }
    });

}

module.exports = {
    set_token: set_token,
    find_token: find_token,
    set_new_password: set_new_password,
}