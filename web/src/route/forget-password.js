import { check_user_mail } from "../services/register-new-user"
import { set_token, tokenFind } from "../services/forget-password"
import { forget_pass } from "../services/send-mail"

let page = (req, res) => {
    return res.render("forget-pass.ejs");
};

let send_link = async (req, res) => {
    try {
        let check = await check_user_mail(req.body.email);
        if (!check) return res.status(500).json("mail not found.");
        let token = Math.floor(Math.random() * (999999 - 100000) + 100000);
        const result = await set_token(req.body.email, token);
        //console.log("result : " + result);
        await forget_pass(req.body.email, token);
        return res.status(200).json("param : " + req.body.email);
    } catch (e) {
        console.log(e)
        return res.status(500).json(e);
    }
}

let token = async (token, email, pass) => {
    try {
        let is_valid_token = await tokenFind(token, email);
        if (!is_valid_token) return res.status(500).json("wrong token.");
        let setNewPass = await setNewPass(email, pass);
    } catch (e) {
        console.log(e)
        return res.status(500).json(e);
    }
}

module.exports = {
    get_forget_pass_page: page,
    send_forget_password_link: send_link,
}