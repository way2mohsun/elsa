import { create_new_user, criteria, check_user_mail } from "../services/register-new-user";
import { welcome } from "../services/send-mail"

let register_page = (req, res) => {
    return res.render("register-new-user.ejs");
};

let create_new_username = async (req, res) => {
    try {
        let data = {
            fname: req.body.fname,
            //username: req.body.username,
            email: req.body.email,
            password: req.body.password,
            repassword: req.body.repassword,
            phone: req.body.phone,
        };

        let check = await check_user_mail(data.email);
        if (check) {
            return res.status(500).json({ message: `The email ${data.email} has already exist. Please choose another email` });
        }
        // const criterias = await criteria();
        // console.log(criterias)
        // let validation_message = await name_criteria(data, criterias);
        // if (validation_message) {
        //     return res.status(500).json({ message: validation_message });
        // }
        // validation_message = await password_criteria(data, criterias);
        // if (validation_message) {
        //     return res.status(500).json({ message: validation_message });
        // }
        await create_new_user(data);
        //await welcome(data.email, `${data.first_name} ${data.last_name}`);
        return res.status(200).json({
            message: "a user create succeeds"
        })
    } catch (e) {
        console.log(e)
        return res.status(500).json({ message: e });
    }
};

let name_criteria = (new_user, criteria) => {
    let key = 'empty-firstname';
    if (new_user.first_name.length < 1) {
        return criteria[key].message;
    }
    key = 'max-length-firstname';
    if (new_user.first_name.length > criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'min-length-firstname';
    if (new_user.first_name.length < criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'empty-lastname';
    if (new_user.last_name.length < 1) {
        return criteria[key].message;
    }
    key = 'max-length-lastname';
    if (new_user.last_name.length > criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'min-length-lastname';
    if (new_user.last_name.length < criteria[key].rule) {
        return criteria[key].message;
    }
    key = 'part-of-firstname';
    if (new_user.password.includes(new_user.first_name)) {
        return criteria[key].message;
    }
    key = 'part-of-lastname';
    if (new_user.password.includes(new_user.last_name)) {
        return criteria[key].message;
    }
}

let password_criteria = async (new_user, criteria) => {
    try {
        console.log(new_user)
        let password = new_user.password;
        var key = 'matching-password-with-repassword';
        if (new_user.password.localeCompare(new_user.repassword) !== 0) {
            return criteria[key].message;
        }
        key = 'minimum-password-length';
        if (password.length < criteria[key].rule) {
            return criteria[key].message;
        }
        key = 'maximum-password-length';
        if (password.length > criteria[key].rule) {
            return criteria[key].message;
        }
        key = 'email';
        if (new_user.email.match(new RegExp(criteria[key].rule, 'g')) === null) {
            return criteria[key].message;
        }
        key = 'part-of-email';
        let [email_left_part, email_right_part] = new_user.email.toLowerCase().replace(/\.\w+/, '').split('@');
        if (password.toLowerCase().includes(email_left_part) || password.toLowerCase().includes(email_right_part)) {
            return criteria[key].message;
        }
        for (let [item, value] of Object.entries(criteria)) {
            if (!(value.must_not || value.must)) {
                continue;
            }
            if (value.must) {
                if (password.match(new RegExp(value.rule, 'g')) === null) {
                    return value.message;
                }
            }
            if (value.must_not) {
                if (password.toLowerCase().match(new RegExp(value.rule, 'g')) !== null) {
                    return value.message;
                }
            }
        }
        /*
        key = 'at-least-one-upper-case-letter';
        if (password.match(new RegExp(criteria[key].rule, 'g')) === null) {
            return criteria[key].message;
        }
        */
        return null;
    } catch (e) {
        console.log(e)
        return e;
    }
}

module.exports = {
    register_page: register_page,
    create_new_username: create_new_username,
    password_criteria: password_criteria,
};
