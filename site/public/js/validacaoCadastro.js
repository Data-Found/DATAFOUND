// function defaultColor() {
//     inpNomeEmpresa.style = " border: 1px solid #9E9E9E ;"
//     inpCNPJ.style = " border: 1px solid #9E9E9E ;"
//     inpEmail.style = " border: 1px solid #9E9E9E ;"
//     inpSenha.style = " border: 1px solid #9E9E9E ;"
//     inpSenhaConfirm.style = " border: 1px solid #9E9E9E ;"
//     inpNumero.style = " border: 1px solid #9E9E9E ;"
//     inpTipo.style = "border: 1px solid #9E9E9E ;"
// }

var msg = '';

function validaInputCadastro(u, e, s, cs, t) {
    // var nomeEmpresa = inpNomeEmpresa.value;
    // var cnpj = inpCNPJ.value;
    var username = u;
    var email = e;
    var senha = s;
    var confirmSenha = cs;
    var token = t;

    var iptEmail = document.getElementById('inpEmail');
    var iptSenha = document.getElementById('inpSenha');
    var iptSenhaC = document.getElementById('inpSenhaConfirm');
    var iptToken = document.getElementById('inpToken');
    var iptUser = document.getElementById('inpUsername');

    // var numero = inpNumero.value;
    // var cep = inpCep.value;
    // var resp = inpResponsavel.value;
    // var username = inpNomeUsuario.value;
    // var tipo = inpTipo.value;
    // var token = inpToken.value;

    iptPadrao();

    if (email == "") {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        msg = ''
        msg = "Digite o email"
        alertCadastro(msg);
    } else if (email.includes("@") == false) {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        msg = ''
        msg = "Email invalido: não contem @"
        alertCadastro(msg);
    } else if (email.trimEnd().trimStart() == '') {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        msg = ''
        msg = "Digite um email válido"
        alertCadastro(msg);
    } else if (senha == "") {
        iptPadrao();
        iptSenha.style = "border:1px solid red;";
        msg = ''
        msg = "Digite a senha"
        alertCadastro(msg);
    } else if (senha.trimEnd().trimStart() == '') {
        iptPadrao();
        iptSenha.style = "border:1px solid red;";
        msg = ''
        msg = "Digite uma senha válida"
        alertCadastro(msg);
    } else if (confirmSenha == "") {
        iptPadrao();
        iptSenhaC.style = "border:1px solid red;";
        msg = ''
        msg = "Por favor confirme a senha"
        alertCadastro(msg);
    } else if (senha != confirmSenha) {
        iptPadrao();
        iptSenhaC.style = "border:1px solid red;";
        iptSenha.style = "border:1px solid red;";
        msg = ''
        msg = "As senhas não coincidem"
        alertCadastro(msg)
    } else if (token == "") {
        iptPadrao();
        iptToken.style = "border:1px solid red;";
        msg = ''
        msg = "Digite um token!"
        alertCadastro(msg)
    } else if (username == "") {
        iptPadrao();
        iptUser.style = "border:1px solid red;";
        msg = ''
        msg = "Digite um nome de usuario!"
        alertCadastro(msg);
    } else if (senha.length < 6) {
        iptPadrao();
        iptSenha.style = "border:1px solid red;"
        msg = '';
        msg = "Digite uma senha maior que 6 digitos";
        alertCadastro(msg);
        return false;
    } else {
        iptPadrao();
        // alertCadastro("Usuario Criado");
        fetch("/usuarios/cadastrar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                // crie um atributo que recebe o valor recuperado aqui
                // Agora vá para o arquivo routes/usuario.js
                // nomeEmpresaServer: nomeEmpresa,
                // cnpjServer: cnpj,
                emailServer: email,
                senhaServer: senha,
                // numeroServer: numero,
                // cepServer: cep,
                // responsavelServer: responsavel,
                usernameServer: username,
                // tipoEmpresaServer: tipoEmpresa,
                tokenServer: token


            })
        }).then(function (resposta) {

            console.log("resposta: ", resposta);

            if (resposta.ok) {
                // cardErro.style.display = "block";

                // mensagem_erro.innerHTML = "Cadastro realizado com sucesso! Redirecionando para tela de Login...";
                let timerInterval
                Swal.fire({
                    icon: 'success',
                    title: `Usuário ${username} criado com sucesso!`,
                    timer: 2000,
                    timerProgressBar: true,
                    didOpen: () => {
                        Swal.showLoading()
                        const b = Swal.getHtmlContainer().querySelector('b')
                        timerInterval = setInterval(() => {
                            b.textContent = Swal.getTimerLeft()
                        }, 100)
                    },
                    willClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {
                    /* Read more about handling dismissals below */
                    if (result.dismiss === Swal.DismissReason.timer) {
                        console.log('I was closed by the timer')
                    }
                })
                setTimeout(() => {
                    window.location.href = "login.html";
                }, 2000)


            } else {
                msg = ''
                msg = "Houve um erro ao tentar realizar o cadastro!"
                alertCadastro(msg);
                throw ("Houve um erro ao tentar realizar o cadastro!");
            }
        }).catch(function (resposta) {
            console.log(`#ERRO: ${resposta}`);

        });

        return false;


    }
}

function iptPadrao() {
    var iptEmail = document.getElementById('inpEmail');
    var iptSenha = document.getElementById('inpSenha');
    var iptSenhaC = document.getElementById('inpSenhaConfirm');
    var iptToken = document.getElementById('inpToken');
    var iptUser = document.getElementById('inpUsername');

    iptEmail.style = "border: #9E9E9E solid 1px;";
    iptSenha.style = "border: #9E9E9E solid 1px;";
    iptSenhaC.style = "border: #9E9E9E solid 1px;";
    iptToken.style = "border: #9E9E9E solid 1px;";
    iptUser.style = "border: #9E9E9E solid 1px;";
}

function alertCadastro(msg) {
    console.log(msg);

    Swal.fire({
        title: 'Error ao realizar cadastro',
        text: msg,
        icon: 'error',
        confirmButtonText: 'Ok'
    })
}