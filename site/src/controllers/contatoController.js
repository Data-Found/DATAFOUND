var contatoModel = require("../models/contatoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA contatoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function enviarMensagem(req, res) {
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var ass = req.body.assServer;
    var msg = req.body.msgServer;

    contatoModel.enviarMsg(nome, email, ass, msg)
        .then(function (resultado) {
            if (resultado > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o envio! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    testar,
    enviarMensagem
}