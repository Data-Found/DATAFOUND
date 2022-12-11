var database = require("../database/config")

function enviarMsg(nome, email, ass, msg) {
    console.log("ACESSEI O CONTATO MODEL PARA ENVIAR MENSAGEM \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    INSERT INTO formContato VALUES('${nome}', '${email}', '${ass}', '${msg}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    enviarMsg
};