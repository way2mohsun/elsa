import connection from "../config/database-connect";
import bcrypt from "bcryptjs";

let find_by_email = (email) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from user where email = ?", email, function (error, rows) {
                if (error) reject(error);
                if (!rows) reject("not fount");
                let user = rows[0];
                resolve(user);
            });
        } catch (e) {
            console.log(e)
            reject(e);
        }
    })
};

let compare_user_password = (user, password) => {
    return new Promise(async (resolve, reject) => {
        try {
            let match = await bcrypt.compare(password, user.password);
            if (match) resolve(true);
            else resolve("The password that you've entered is incorrect")
        } catch (e) {
            console.log(e)
            reject(e);
        }
    })
};

let find_by_id = (id) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from user where id = ?", id, function (error, rows) {
                if (error) reject(error);
                let user = rows[0];
                resolve(user);
            });
        } catch (e) {
            console.log(e)
            reject(e);
        }
    })
};

module.exports = {
    compare_user_password: compare_user_password,
    find_by_email: find_by_email,
    find_user_by_id: find_by_id
};