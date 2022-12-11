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

function valoresSetor(idSetor, idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL - VALORESSETOR \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function valoresSetor()");
    var instrucao = `
    SELECT TOP 7 CONVERT(varchar, Leitura.dtLeitura, 108) AS 'horario', count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
    JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
        JOIN Setor ON Sensor.fkSetor = Setor.idSetor
            JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                WHERE Empresa.idEmpresa = ${idEmpresa}
                    AND Leitura.movimento = 1
                        AND Setor.idSetor = ${idSetor}
                            GROUP BY CONVERT(varchar, Leitura.dtLeitura, 108)
                            ORDER BY CONVERT(varchar, Leitura.dtLeitura, 108) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function atualizarGraficoSetor(idSetor, idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL - ATUALIZAR GRÁFICO \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function valoresSetor()");
    var instrucao = `
    SELECT TOP 7 CONVERT(varchar, Leitura.dtLeitura, 108) AS 'horario', count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
    JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
        JOIN Setor ON Sensor.fkSetor = Setor.idSetor
            JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                WHERE Empresa.idEmpresa = ${idEmpresa}
                    AND Leitura.movimento = 1
                        AND Setor.idSetor = ${idSetor}
                            GROUP BY CONVERT(varchar, Leitura.dtLeitura, 108)
                            ORDER BY CONVERT(varchar, Leitura.dtLeitura, 108) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterDados(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL PARA OBTER OS DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT TOP 5 Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
	JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
		JOIN Setor ON Sensor.fkSetor = Setor.idSetor
			JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
				WHERE Empresa.idEmpresa = ${idEmpresa}
					AND Leitura.movimento = 1
						GROUP BY Setor.nomeSetor;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}
function obterDados(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL PARA OBTER OS DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
	JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
		JOIN Setor ON Sensor.fkSetor = Setor.idSetor
			JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
				WHERE Empresa.idEmpresa = ${idEmpresa}
					AND Leitura.movimento = 1
						GROUP BY Setor.nomeSetor
						    ORDER BY Setor.nomeSetor DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterDadosGrafico(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL PARA OBTER OS DADOS DO GRÁFICO \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT TOP 5 Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
	JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
		JOIN Setor ON Sensor.fkSetor = Setor.idSetor
			JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
				WHERE Empresa.idEmpresa = ${idEmpresa}
					AND Leitura.movimento = 1
						GROUP BY Setor.nomeSetor
                            ORDER BY COUNT(Leitura.movimento) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterMaxDados(idEmpresa) {
    console.log("ACESSEI O FLUXO MODEL PARA OBTER O MAX DE DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT TOP 1 Setor.nomeSetor, MAX(CONVERT(varchar, Leitura.dtLeitura, 103)) dataHora, COUNT(Leitura.movimento) qtdMax FROM Leitura 
    JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
        JOIN Setor ON Sensor.fkSetor = Setor.idSetor
            JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                WHERE Empresa.idEmpresa = ${idEmpresa}
                    AND Leitura.movimento = 1
                        GROUP BY Setor.nomeSetor
                             ORDER BY qtdMax DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterMinDados(idEmpresa) {
    console.log("ACESSEI O FLUXO MODEL PARA OBTER O MIN DE DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT TOP 1 Setor.nomeSetor, MAX(CONVERT(varchar, Leitura.dtLeitura, 103)) dataHora, COUNT(Leitura.movimento) qtdMax FROM Leitura 
    JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
        JOIN Setor ON Sensor.fkSetor = Setor.idSetor
            JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                WHERE Empresa.idEmpresa = ${idEmpresa}
                    AND Leitura.movimento = 1
                        GROUP BY Setor.nomeSetor
                             ORDER BY qtdMax;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterPicoDados(idEmpresa) {
    console.log("ACESSEI O FLUXO MODEL PARA OBTER O PICO DE DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT CONVERT(varchar, Leitura.dtLeitura, 103) data, CONVERT(varchar, Leitura.dtLeitura, 108) hora, count(Leitura.movimento) qtd FROM Empresa
    JOIN Setor ON Empresa.idEmpresa = Setor.fkEmpresa
        JOIN Sensor ON Setor.idSetor = Sensor.fkSetor
            JOIN Leitura ON Sensor.idSensor = Leitura.fkSensor
                WHERE Empresa.idEmpresa = ${idEmpresa} 
                    AND Leitura.movimento = 1
                        GROUP BY Leitura.dtLeitura;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function obterSetores(idEmpresa) {
    console.log("ACESSEI O FLUXO MODEL PARA OBTER O PICO DE DADOS \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
    SELECT nomeSetor, maxSetor FROM Setor
	JOIN Empresa ON fkEmpresa = idEmpresa
		WHERE idEmpresa = ${idEmpresa}
		    ORDER BY Setor.nomeSetor DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function atualizarGrafico(idEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `
        SELECT TOP 5 Setor.nomeSetor, count(Leitura.movimento) AS 'qtdSetor' FROM Leitura 
        JOIN Sensor ON Leitura.fkSensor = Sensor.idSensor
            JOIN Setor ON Sensor.fkSetor = Setor.idSetor
                JOIN Empresa ON Setor.fkEmpresa = Empresa.idEmpresa
                    WHERE Empresa.idEmpresa = ${idEmpresa}
                        AND Leitura.movimento = 1
                            GROUP BY Setor.nomeSetor
                                ORDER BY COUNT(Leitura.movimento) DESC;`;

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
    valoresSetor,
    atualizarGraficoSetor,
    obterDados,
    obterDadosGrafico,
    obterMaxDados,
    obterMinDados,
    obterPicoDados,
    obterSetores,
    atualizarGrafico
};