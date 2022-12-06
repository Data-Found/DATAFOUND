var database = require("../database/config")

function listar(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT * FROM [dbo].[Usuario] as usu 
	JOIN [dbo].[Empresa] as emp ON usu.fkEmpresa = emp.idEmpresa
		JOIN [dbo].[Setor] as s ON s.fkEmpresa = emp.idEmpresa 
			JOIN [dbo].[Sensor] AS sens ON sens.fkSetor = s.idSetor
				JOIN [dbo].[Leitura] as lt ON lt.fkSensor = sens.idSensor
					WHERE usu.idUsuario = ${idUsuario};
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
};