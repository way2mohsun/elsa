let home_page = (req, res) => {
    return res.render("homepage.ejs", {
        user: req.user
    })
};

module.exports = {
    home_page: home_page
};
