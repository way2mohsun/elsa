import { topic } from '../services/topic'

let home_page = (req, res) => {
    return res.render("home-page.ejs", {
        user: req.user
    });
};

let tst = (req, res) => {
    return res.render("tst.ejs", {});
};


let init_home_page = async (req, res) => {
    try {
        let topics = await topic(req.session.user_id);
        return res.status(200).json(topics);
    } catch (e) {
        console.log(e);
        return res.status(400).json(e);
    }
}

module.exports = {
    tst: tst,
    home_page: home_page,
    init_home_page: init_home_page,
};
