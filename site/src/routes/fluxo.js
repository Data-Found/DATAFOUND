var express = require("express");
var router = express.Router();

var fluxoController = require("../controllers/fluxoController");

router.get("/", function (req, res) {
    fluxoController.testar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    fluxoController.listar(req, res);
});

module.exports = router;