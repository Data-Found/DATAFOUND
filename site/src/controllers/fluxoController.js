var fluxoModel = require("../models/fluxoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA fluxoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    var idUsuario = req.params.idUsuario;
    console.log(idUsuario)
    fluxoModel.listar(idUsuario)
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

function obterDados(req, res) {
    var idUsuario = req.params.idUsuario;
    console.log(idUsuario)
    fluxoModel.obterDados(idUsuario)
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

function atualizarGrafico(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Recuperando counts em tempo real`);

    fluxoModel.atualizarGrafico(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas counts.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    listar,
    testar,
    obterDados,
    atualizarGrafico
}