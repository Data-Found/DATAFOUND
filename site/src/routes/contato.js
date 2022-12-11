var express = require("express");
var router = express.Router();

var contatoController = require("../controllers/contatoController");

router.get("/", function (req, res) {
    contatoController.testar(req, res);
});

router.post("/enviarMensagem", function (req, res) {
    contatoController.enviarMensagem(req, res);
});

module.exports = router;