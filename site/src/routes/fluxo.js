var express = require("express");
var router = express.Router();

var fluxoController = require("../controllers/fluxoController");

router.get("/", function (req, res) {
    fluxoController.testar(req, res);
});

router.get("/valoresSetor/:empresaID/:setorID", function (req, res) {
    fluxoController.valoresSetor(req, res)
});

router.get("/atualizarGraficoSetor/:empresaID/:setorID", function (req, res) {
    fluxoController.atualizarGraficoSetor(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    fluxoController.listar(req, res);
});

router.get("/obterDados/:idEmpresa", function (req, res) {
    fluxoController.obterDados(req, res);
});

router.get("/obterDadosGrafico/:idEmpresa", function (req, res) {
    fluxoController.obterDadosGrafico(req, res);
});

router.get("/atualizarGrafico/:idEmpresa", function (req, res) {
    fluxoController.atualizarGrafico(req, res);
});

router.get("/obterMaxDados/:idEmpresa", function (req, res) {
    fluxoController.obterMaxDados(req, res);
}); 

router.get("/obterMinDados/:idEmpresa", function (req, res) {
    fluxoController.obterMinDados(req, res);
}); 

router.get("/obterPicoDados/:idEmpresa", function (req, res) {
    fluxoController.obterPicoDados(req, res);
});

router.get("/obterSetores/:idEmpresa", function (req, res) {
    fluxoController.obterSetores(req, res);
});

module.exports = router;