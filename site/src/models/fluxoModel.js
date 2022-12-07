var database = require("../database/config")

function listar(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT * FROM [dbo].[Empresa] 
    JOIN [dbo].[Usuario] ON Empresa.idEmpresa = Usuario.fkEmpresa 
        JOIN [dbo].[Setor] ON Empresa.idEmpresa = Setor.fkEmpresa
            JOIN [dbo].[Sensor] ON Setor.fkEmpresa = Sensor.fkSetor
                JOIN [dbo].[Leitura] ON Sensor.idSensor = Leitura.fkSensor
                    WHERE Usuario.idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
};