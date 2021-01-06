const nodemailer = require("nodemailer");
const fs = require('fs');
require("dotenv").config();

let transporter = nodemailer.createTransport({
    host: process.env.mail_host,
    port: process.env.mail_port,
    secure: true,
    auth: {
        user: process.env.mail_user,
        pass: process.env.mail_pass,
    },
});

let template_file = __dirname + '/../' + process.env.mail_path + '/';

let welcome = (mail, name) => {
    var template = fs.readFileSync(template_file + 'welcome.html', 'utf8');
    template = template.replace(/USR-NAME/g, name);
    async function main() {
        let testAccount = await nodemailer.createTestAccount();
        let info = await transporter.sendMail({
            from: process.env.mail_from,
            to: mail,
            subject: "Welcome ✔",
            text: "Welcome ",
            html: template,
        });
    }
    main().catch(console.error);
}

let forget_pass = (mail, toekn) => {
    var template = fs.readFileSync(template_file + 'forget-pass.html', 'utf8');
    template = template.
        replace(/TOKEN/g, toekn).
        replace(/EMAIL/g, mail).
        replace(/DOMAIN/g, process.env.app_domain);
    async function main() {
        let testAccount = await nodemailer.createTestAccount();
        let info = await transporter.sendMail({
            from: process.env.mail_from,
            to: mail,
            subject: "Forget Password",
            text: "Forget Password ",
            html: template,
        });
    }
    main().catch(console.error);
}


module.exports = {
    welcome: welcome,
    forget_pass: forget_pass
}