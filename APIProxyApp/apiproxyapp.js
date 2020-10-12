/*jshint esversion: 6 */

const Express = require('express');
const BodyParser = require('body-parser');
const Http = require("http");
const Axios = require("axios");
const DotEnv = require("dotenv");
const FS = require("fs");
const _express = Express();
const _httpServer = Http.createServer(_express);

_express.use(BodyParser.json
({

    extended: true

}));

_express.use(BodyParser.urlencoded
({

    extended: true

}));

DotEnv.config();

_express.get('/', (req, res) =>
{
    
    // Axios.get(process.env.API_URL)
    // .then((response) =>
    // {

    //     res.send(response.data + '\n');

    // }).catch((error) =>
    // {

    //     res.send(error.message + '\n');

    // });

    res.send("GET" + "\n");

});

_express.post('/api/post', (req, res) =>
{
    
    // Axios.post(process.env.API_URL + "/api/post")
    // .then((response) =>
    // {

    //     res.send(response.data + '\n');

    // }).catch((error) =>
    // {

    //     res.send(error + '\n');

    // });

    res.send("POST" + "\n");


});

let port = process.env.PORT || 7006;
let host = "0.0.0.0";
_httpServer.listen(port, host, function ()
{

    console.log(`Docker container started the server on port ${_httpServer.address().port}\n`);

});

_httpServer.on("close", function ()
{

    console.log("We are Closing\n");    


});

process.on("SIGINT", function()
{
    _httpServer.close();

});
