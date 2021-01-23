let home_page = (req, res) => {
    return res.render("homepage.ejs", {
        user: req.user
    });
};

let init_home_page = (req, res) => {

    console.log(req.body);
    return res.status(400).json({ text: 'done' });
}

module.exports = {
    home_page: home_page,
    init_home_page: init_home_page,
};
