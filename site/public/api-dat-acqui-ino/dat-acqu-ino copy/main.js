// não altere!
const serialport = require('serialport');
const express = require('express');
const mysql = require('mysql2');
const sql = require('mssql');
var test = [];
var qtd = 0;
// var setor = sessionStorage.ID_ELET;

// não altere!
const SERIAL_BAUD_RATE = 9600;
const SERVIDOR_PORTA = 3300;

// configure a linha abaixo caso queira que os dados capturados sejam inseridos no banco de dados.
// false -> nao insere
// true -> insere
const HABILITAR_OPERACAO_INSERIR = true;

// altere o valor da variável AMBIENTE para o valor desejado:
// API conectada ao banco de dados remoto, SQL Server -> 'producao'
// API conectada ao banco de dados local, MySQL Workbench - 'desenvolvimento'
const AMBIENTE = 'producao';

const serial = async (
    valoresChave,
    valoresChave2,
    valoresChave3,
    valoresChave4,
    valoresChave5
) => {
    let poolBancoDados = ''

    if (AMBIENTE == 'desenvolvimento') {
        poolBancoDados = mysql.createPool(
            {
                // altere!
                // CREDENCIAIS DO BANCO LOCAL - MYSQL WORKBENCH
                host: 'localhost',
                user: 'insertGrupo6',
                password: 'admDataFound',
                database: 'DataFound'
            }
        ).promise();
    } else if (AMBIENTE == 'producao') {
        console.log('Projeto rodando inserindo dados em nuvem. Configure as credenciais abaixo.');
    } else {
        throw new Error('Ambiente não configurado. Verifique o arquivo "main.js" e tente novamente.');
    }


    const portas = await serialport.SerialPort.list();
    const portaArduino = portas.find((porta) => porta.vendorId == 2341 && porta.productId == 43);
    if (!portaArduino) {
        throw new Error('O arduino não foi encontrado em nenhuma porta serial');
    }
    const arduino = new serialport.SerialPort(
        {
            path: portaArduino.path,
            baudRate: SERIAL_BAUD_RATE
        }
    );
    arduino.on('open', () => {
        console.log(`A leitura do arduino foi iniciada na porta ${portaArduino.path} utilizando Baud Rate de ${SERIAL_BAUD_RATE}`);
    });
    arduino.pipe(new serialport.ReadlineParser({ delimiter: '\r\n' })).on('data', async (data) => {
        //console.log(data);
        const valores = data.split(';');
        const chave = parseInt(valores[0]);
        const chave2 = parseInt(Math.random(0, 1).toFixed());
        const chave3 = parseInt(Math.random(0, 1).toFixed());
        const chave4 = parseInt(Math.random(0, 1).toFixed());
        const chave5 = parseInt(Math.random(0, 1).toFixed());



        valoresChave.push(chave);
        valoresChave2.push(chave2);
        valoresChave3.push(chave3);
        valoresChave4.push(chave4);
        valoresChave5.push(chave5);

        if (HABILITAR_OPERACAO_INSERIR) {
            if (AMBIENTE == 'producao') {
                // const chave = parseInt(Math.random(0, 1).toFixed());
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
                console.log("AAAAAAAAAAAAAAAAAAAAA")
                console.log("valoresChave", valoresChave)
                console.log("valoresChave2", valoresChave2)
                console.log("valoresChave3", valoresChave3)
                console.log("valoresChave4", valoresChave4)
                console.log("valoresChave5", valoresChave5)

                // alert("ta caindo aqui antes do if")
                const connStr = "Server=datafound.database.windows.net;Database=bdDataFound;User Id=root_datafound;Password=#Gfgrupo6;";

                if (valoresChave != '') {
                    sqlquery =
                        `INSERT INTO Leitura (movimento, fkSensor) VALUES
                        (${chave}, 1);`;
                    function inserirComando(conn, sqlquery) {
                        conn.query(sqlquery);
                    }
                    sql.connect(connStr)
                        .then(conn => inserirComando(conn, sqlquery))
                        .catch(err => console.log("erro! " + err));
                    console.log("Entrei no 1")
                }

                if (valoresChave2 != '') {
                    sqlquery2 =
                        `INSERT INTO Leitura (movimento, fkSensor) VALUES
                        (${chave2}, 2);`;
                    function inserirComando(conn, sqlquery2) {
                        conn.query(sqlquery2);
                    }
                    sql.connect(connStr)
                        .then(conn => inserirComando(conn, sqlquery2))
                        .catch(err => console.log("erro! " + err));
                    console.log("Entrei no 2")
                    console.log(chave2);
                }

                if (valoresChave3 != '') {
                    sqlquery3 =
                        `INSERT INTO Leitura (movimento, fkSensor) VALUES
                    (${chave3}, 3);`;
                    function inserirComando(conn, sqlquery3) {
                        conn.query(sqlquery3);
                    }
                    sql.connect(connStr)
                        .then(conn => inserirComando(conn, sqlquery3))
                        .catch(err => console.log("erro! " + err));
                    console.log("Entrei no 3")
                    console.log(chave3);
                }

                if (valoresChave4 != '') {
                    sqlquery4 =
                        `INSERT INTO Leitura (movimento, fkSensor) VALUES
                        (${chave4}, 4);`;
                    function inserirComando(conn, sqlquery4) {
                        conn.query(sqlquery4);
                    }
                    sql.connect(connStr)
                        .then(conn => inserirComando(conn, sqlquery4))
                        .catch(err => console.log("erro! " + err));
                    console.log("Entrei no 4")
                    console.log(chave4);
                }

                if (valoresChave5 != '') {
                    sqlquery5 =
                        `INSERT INTO Leitura (movimento, fkSensor) VALUES
                        (${chave5}, 5);`;
                    function inserirComando(conn, sqlquery5) {
                        conn.query(sqlquery5);
                    }
                    sql.connect(connStr)
                        .then(conn => inserirComando(conn, sqlquery5))
                        .catch(err => console.log("erro! " + err));
                    console.log("Entrei no 5")
                    console.log(chave5);
                }

            } else {
                throw new Error('Ambiente não configurado. Verifique o arquivo "main.js" e tente novamente.');
            }
        }
    });
    arduino.on('error', (mensagem) => {
        console.error(`Erro no arduino (Mensagem: ${mensagem}`)
    });
}


// não altere!
const servidor = (
    valoresChave,
    valoresChave2,
    valoresChave3,
    valoresChave4,
    valoresChave5
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

    app.get('/sensores/chave', (_, response) => {
        return response.json(valoresChave);
    });
    app.get('/sensores/chave2', (_, response) => {
        return response.json(valoresChave2);
    });
    app.get('/sensores/chave3', (_, response) => {
        return response.json(valoresChave3);
    });
    app.get('/sensores/chave4', (_, response) => {
        return response.json(valoresChave4);
    });
    app.get('/sensores/chave5', (_, response) => {
        return response.json(valoresChave5);
    });
}

(async () => {
    const valoresChave = [];
    const valoresChave2 = [];
    const valoresChave3 = [];
    const valoresChave4 = [];
    const valoresChave5 = [];
    await serial(
        valoresChave,
        valoresChave2,
        valoresChave3,
        valoresChave4,
        valoresChave5,
    );
    servidor(
        valoresChave,
        valoresChave2,
        valoresChave3,
        valoresChave4,
        valoresChave5
    );
})();