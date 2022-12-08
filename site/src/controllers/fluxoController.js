var fluxoModel = require("../models/fluxoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA fluxoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.listar(idEmpresa)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    listar,
    testar
}