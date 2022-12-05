function defaultColor() {
    inpEmail.style = " border: 1px solid #9E9E9E ;"
    inpSenha.style = " border: 1px solid #9E9E9E ;"
}

var msg = ''

function validaInputLogin(e, s, emailVar, senhaVar) {
    var email = e;
    var senha = s;
    var iptSenha = document.getElementById('senha_input');
    var iptEmail = document.getElementById('email_input');
    if (email == "" && senha == "") {
        msg = '';
        msg = "Mensagem de erro para todos os campos em branco";
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        iptSenha.style = "border:1px solid red;"
        alertLogin(msg);
        return false;
    } else if (email == '') {
        msg = '';
        msg = "Digite um email no primeiro campo";
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        alertLogin(msg);
        return false;
    } else if (email.includes("@") == false) {
        msg = '';
        msg = "Email invalido: não contêm @";
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        alertLogin(msg);
        return false;
    } else if (senha == '') {
        msg = '';
        msg = "Digite uma senha no segundo campo";
        iptPadrao();
        iptSenha.style = "border:1px solid red;"
        alertLogin(msg);
        return false;
    } else {
        fetch("/usuarios/autenticar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                emailServer: email,
                senhaServer: senha
            })
        }).then(function (resposta) {
            console.log("ESTOU NO THEN DO entrar()!")

            if (resposta.ok) {
                console.log(resposta);
                let timerInterval
                Swal.fire({
                    icon:'success',
                    title: `Seja Bem Vindo! ${email}`,
                    timer: 1500,
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
                resposta.json().then(json => {
                    console.log(json);
                    console.log(JSON.stringify(json));

                    sessionStorage.EMAIL_USUARIO = json.email;
                    sessionStorage.NOME_USUARIO = json.nomeUsuario;
                    sessionStorage.ID_USUARIO = json.idUsuario;

                    setTimeout(function () {
                        window.location = "dashboard/dashboard.html";
                    }, 1000); // apenas para exibir o loading

                });

            } else {

                console.log("Houve um erro ao tentar realizar o login!");

                resposta.text().then(texto => {
                    console.error(texto);
                    msg = '';
                    msg = "Email e/ou senha inválidos";
                    alertLogin(msg);
                });
            }

        }).catch(function (erro) {
            console.log(erro);
        })

        return false;
    }
    
    iptPadrao();
}

function iptPadrao() {
    var iptEmail = document.getElementById('email_input');
    var iptSenha = document.getElementById('senha_input');

    iptEmail.style = "border: #9E9E9E solid 1px;";
    iptSenha.style = "border: #9E9E9E solid 1px;";
}

function alertLogin(msg) {
        console.log(msg);

        Swal.fire({
            title: 'Error ao realizar login',
            text: msg,
            icon: 'error',
            confirmButtonText: 'Ok'
        })
}