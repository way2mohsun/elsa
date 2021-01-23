import connection from "../config/database-connect";

let topic = (email) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from topic where ", null, function (error, rows) {
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


module.exports = {
    topic: topic,
};