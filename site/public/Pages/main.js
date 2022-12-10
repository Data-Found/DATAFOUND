// não altere!
const express = require('express');
const mysql = require('mysql2');
const sql = require('mssql');
var test = [];
var qtd = 0;


// não altere!
const SERVIDOR_PORTA = 3300;

// configure a linha abaixo caso queira que os dados capturados sejam inseridos no banco de dados.
// false -> nao insere
// true -> insere
const HABILITAR_OPERACAO_INSERIR = true;

// altere o valor da variável AMBIENTE para o valor desejado:
// API conectada ao banco de dados remoto, SQL Server -> 'producao'
// API conectada ao banco de dados local, MySQL Workbench - 'desenvolvimento'
const AMBIENTE = 'producao';

setInterval(() => {
    if (HABILITAR_OPERACAO_INSERIR) {
        if (AMBIENTE == 'producao') {
            const chave = parseInt(Math.random(0, 1).toFixed());
            // altere!
            // Este insert irá inserir os dados na tabela "medida"
            // -> altere nome da tabela e colunas se necessário
            // Este insert irá inserir dados de fk_aquario id=1 (fixo no comando do insert abaixo)
            // >> Importante! você deve ter o aquario de id 1 cadastrado.
            // `INSERT INTO medida (dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario) VALUES (${dht11Umidade}, ${dht11Temperatura}, ${luminosidade}, ${lm35Temperatura}, ${chave}, CURRENT_TIMESTAMP, 1)`

            // CREDENCIAIS DO BANCO REMOTO - SQL SERVER
            // Importante! você deve ter criado o usuário abaixo com os comandos presentes no arquivo
            // "script-criacao-usuario-sqlserver.sql", presente neste diretório.
            // const connStr = "Server=servidor-acquatec.database.windows.net;Database=bd-acquatec;User Id=usuarioParaAPIArduino_datawriter;Password=#Gf_senhaParaAPI;";

            // if(chave == 1) {
            //     qtd++
            // }

            sqlquery =
                `INSERT INTO Leitura (movimento, fkSensor) VALUES
        (${chave}, 2);`;
            const connStr = "Server=datafound.database.windows.net;Database=bdDataFound;User Id=root_datafound;Password=#Gfgrupo6;";
            function inserirComando(conn, sqlquery) {
                conn.query(sqlquery);
                // console.log(chave)
                test.push(chave);

                if (chave == 1) {
                    qtd++
                }
                console.log("Fluxo cadastrado: " + test + " -- " + qtd)

            }

            sql.connect(connStr)
                .then(conn => inserirComando(conn, sqlquery))
                .catch(err => console.log("erro! " + err));

        } else {
            throw new Error('Ambiente não configurado. Verifique o arquivo "main.js" e tente novamente.');
        }
    }
}, 1000)

// não altere!
const servidor = (
    valoresChave,
    valoresChave2,
    // valoresChave3,
    // valoresChave4,
    // valoresChave5
) => {
    const app = express();
    app.use((request, response, next) => {
        response.header('Access-Control-Allow-Origin', '*');
        response.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
        next();
    });
    app.listen(SERVIDOR_PORTA, () => {
        console.log(`API executada com sucesso na porta ${SERVIDOR_PORTA}`);
    });

    valoresChave = test;

    app.get('/sensores/chave', (_, response) => {
        return response.json(valoresChave);
    });
    app.get('/sensores/chave2', (_, response) => {
        return response.json(valoresChave2);
    });
    // app.get('/sensores/chave3', (_, response) => {
    //     return response.json(valoresChave3);
    // });
    // app.get('/sensores/chave4', (_, response) => {
    //     return response.json(valoresChave4);
    // });
    // app.get('/sensores/chave5', (_, response) => {
    //     return response.json(valoresChave5);
    // });
}

(async () => {
    const valoresChave = [];
    const valoresChave2 = [];
    // const valoresChave3 = [];
    // const valoresChave4 = [];
    // const valoresChave5 = [];
    servidor(
        valoresChave,
        valoresChave2,
        // valoresChave3,
        // valoresChave4,
        // valoresChave5
    );
})();