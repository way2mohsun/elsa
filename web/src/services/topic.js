import connection from "../config/database-connect";

let topic = (user_id) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query("SELECT * from topic where ?",
                { user: user_id },
                function (error, rows) {
                    if (error) reject(error);
                    resolve(rows);
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