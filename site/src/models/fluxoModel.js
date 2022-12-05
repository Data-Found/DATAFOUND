var database = require("../database/config")

function listar(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT usu.idUsuario, count(lei.movimento) leitura, lei.fkSensor FROM Usuario AS usu 
    JOIN Empresa ON usu.fkEmpresa = Empresa.idEmpresa
        JOIN Setor ON Empresa.idEmpresa = Setor.fkEmpresa
            JOIN Sensor ON Setor.idSetor = Sensor.fkSetor
                JOIN Leitura AS lei ON Setor.idSetor = lei.fkSensor
                    WHERE usu.idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
};