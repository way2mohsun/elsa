import { set_new_password } from "../services/forget-password"
import { password_criteria } from "./register-new-user"
import { criteria } from "../services/register-new-user";

let rpass_page = (req, res) => {
    return res.render("reset-pass.ejs");
};


let set_new_pass = async (req, res) => {
    try {
        let data = {
            password: req.body.password,
            repassword: req.body.repassword,
            email: req.body.email,
        }
        const criterias = await criteria();
        let validation_message = await password_criteria(data, criterias);
        if (validation_message) {
            return res.status(500).json({ message: validation_message });
        }
        req.body.token = parseInt(req.body.token);
        if (isNaN(req.body.token)) return res.status(500).json({ message: "Token is wrong." });
        await set_new_password(data.email, data.password, req.body.token);
        res.status(200).json({ message: 'Reset password has been done.' });
    } catch (e) {
        console.log(e);
        return res.status(500).json({ message: e });
    }
}



module.exports = {
    reset_pass_page: rpass_page,
    set_new_pass: set_new_pass,
}