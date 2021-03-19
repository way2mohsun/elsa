"use strict";

let card =
    `
<div id="CARD-ID" class="card" style="width: 90%;margin-top:5%">
    <button type="button" class="close-hat btn btn-danger btn-circle btn-xl" >
        <i class="fa fa-times"></i>
    </button>
    <div class="card-body">
        <h5 class="card-title">TITLE</h5>
        <p class="card-text">DESC</p>
        <a href="#" class="text-primary">Watch</a>
    </div>
</div>
`

let request = new Request(
    new URL('http://localhost:3000/'), {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    //body: JSON.stringify({ name: 'Sara' }),
});

(function () {

    fetch(request)
        .then(response => {
            //response.headers.get('Content-Type'));
            //response.headers.get('Date'));
            //response.status);
            //response.statusText);
            //response.type);
            //response.url);
            // response.text().then(data => {
            response.json().then(data => {
                for (const c of data) {
                    var mydiv = document.getElementById("cards");
                    mydiv.insertAdjacentHTML('beforeend',
                        card.replace(/TITLE/g, c.title)
                            .replace(/CARD-ID/g, c.id)
                            .replace(/DESC/g, c.desc));
                }
            });

        })
        .catch(err => {
            console.log(err);
        });






})();


$(document).ready(function () {
    $(".btn").click(function () {
        $("#myModal").modal('show');
    });
});


