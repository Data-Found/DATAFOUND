var fluxoModel = require("../models/fluxoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA fluxoController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function valoresSetor(req, res) {
    // var idSetor = 1
    // var idEmpresa = 1
    var idSetor = req.params.setorID
    var idEmpresa = req.params.empresaID
    fluxoModel.valoresSetor(idSetor, idEmpresa)
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

function atualizarGraficoSetor(req, res) {

    var idSetor = req.params.setorID;
    var idEmpresa = req.params.empresaID;
    console.log(`Recuperando counts em tempo real`);

    fluxoModel.atualizarGraficoSetor(idSetor, idEmpresa).then(function (resultado) {
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
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterDados(idEmpresa)
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

function obterDadosGrafico(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterDadosGrafico(idEmpresa)
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

function obterMaxDados(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterMaxDados(idEmpresa)
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

function obterMinDados(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterMinDados(idEmpresa)
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

function obterPicoDados(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterPicoDados(idEmpresa)
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

function obterSetores(req, res) {
    var idEmpresa = req.params.idEmpresa;
    console.log(idEmpresa)
    fluxoModel.obterSetores(idEmpresa)
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

    var idEmpresa = req.params.idEmpresa;

    console.log(`Recuperando counts em tempo real`);

    fluxoModel.atualizarGrafico(idEmpresa).then(function (resultado) {
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
    valoresSetor,
    atualizarGraficoSetor,
    obterDados,
    obterDadosGrafico,
    obterMaxDados,
    obterMinDados,
    obterPicoDados,
    obterSetores,
    atualizarGrafico
}