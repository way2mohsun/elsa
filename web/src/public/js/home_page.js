var request = new Request(
    new URL('http://localhost:3000/'), {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({ name: 'Sara' }),
});

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
            console.log(data);
        });
    })
    .catch(err => {
        console.log(err);
    })

