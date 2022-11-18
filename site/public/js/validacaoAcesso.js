function defaultColor(){
 inpEmail.style = " border: 1px solid #9E9E9E ;"
 inpSenha.style = " border: 1px solid #9E9E9E ;"
}
function validaInputLogin(e, s) {
    var email = e;
    var senha = s;
    var iptSenha = document.getElementById('senha_input');
    var iptEmail = document.getElementById('email_input');
    if (email == "" && senha == "") {
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        iptSenha.style = "border:1px solid red;"
        alert("Mensagem de erro para todos os campos em branco");
        return false;
    } else if (email == '') {
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        alert("Digite um email no primeiro campo")
        return false;
    } else if (email.includes("@") == false) {
        iptPadrao();
        iptEmail.style = "border:1px solid red;"
        alert("Email invalido: não contem @")
        return false;
    } else if (senha == '') {
        iptPadrao();
        iptSenha.style = "border:1px solid red;"
        alert("Digite uma senha no segundo campo")
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