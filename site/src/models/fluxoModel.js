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

function obterDados(idUsuario) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
	JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
		JOIN Setor ON Sensor.fkSetor = Setor.idSetor
			JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
				WHERE Empresa.idEmpresa = ${idUsuario}
					AND Leitura.movimento = 1
						GROUP BY Setor.nomeSetor;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function atualizarGrafico(idUsuario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
        JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
            JOIN Setor ON Sensor.fkSetor = Setor.idSetor
                JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                    WHERE Empresa.idEmpresa = ${idUsuario}  
                        AND Leitura.movimento = 1
                            GROUP BY Setor.nomeSetor;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `none`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listar,
    obterDados,
    atualizarGrafico
};