var database = require("../database/config")

function listar(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT nomeSetor setor, count(Leitura.movimento) leitura FROM Setor
    JOIN Sensor ON Setor.idSetor = Sensor.fkSetor
      JOIN Leitura ON Sensor.idSensor = Leitura.fkSensor
           JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
           WHERE Empresa.idEmpresa = ${idEmpresa} AND Leitura.movimento = 1 
              GROUP BY Setor.nomeSetor;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
};