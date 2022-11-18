// function defaultColor() {
//     inpNomeEmpresa.style = " border: 1px solid #9E9E9E ;"
//     inpCNPJ.style = " border: 1px solid #9E9E9E ;"
//     inpEmail.style = " border: 1px solid #9E9E9E ;"
//     inpSenha.style = " border: 1px solid #9E9E9E ;"
//     inpSenhaConfirm.style = " border: 1px solid #9E9E9E ;"
//     inpNumero.style = " border: 1px solid #9E9E9E ;"
//     inpTipo.style = "border: 1px solid #9E9E9E ;"
// }
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


     if (email == "") {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        alert("Digite o email");
    } else if (email.includes("@") == false) {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        alert("Email invalido: não contem @");
    } else if(email.trimEnd().trimStart() == '') {
        iptPadrao();
        iptEmail.style = "border:1px solid red;";
        alert("Digite um email válido");  
    } else if (senha == "") {
        iptPadrao();
        iptSenha.style = "border:1px solid red;";
        alert("Digite a senha");
    } else if(iptSenha.trimEnd().trimStart() == '') {
        iptPadrao();
        iptSenha.style = "border:1px solid red;";
        alert("Digite uma senha válida");
    } else if (confirmSenha == "") {
        iptPadrao();
        iptSenhaConfirm.style = "border:1px solid red;";
        alert("Por favor confirme a senha");
    } else if (senha != confirmSenha) {
        iptPadrao();
        inpSenhaConfirm.style = "border:1px solid red;";
        inpSenha.style = "border:1px solid red;";
        alert("As senhas não coincidem")
    } else if (token == "") {
        iptPadrao();
        iptToken.style = "border:1px solid red;";
        alert("Digite um token!")
    } else if (username == "") {
        iptPadrao();
        inpNomeUsuario.style = "border:1px solid red;";
        alert("Digite um nome de usuario!");
    } else {
        iptPadrao();
        alert("Usuario Criado");
    }
    //    if (email == '') {
    //        inpEmail.style = "border:1px solid red;"
    //        alert("Digite um email no primeiro campo")
    //    }else if(){
    //    }
    // else if (email.includes("@") == false) {
    //    inpEmail.style = "border:1px solid red;"
    //    alert("Email invalido: não contem @")
    //    }else if (senha == '') {
    //        inpSenha.style = "border:1px solid red;"
    //        alert("Digite uma senha no primeiro campo")
    //    }else if(email == "adm@datafound.com" && senha == "1234"){
    //        window.location.href = "dashboard.html"
    //    }else{
    //        alert("Usuario e email invalido");
    //    }
    iptPadrao();
}

function iptPadrao() {
    var iptEmail = document.getElementById('inpEmail');
    var iptSenha = document.getElementById('inpSenha');
    var iptSenhaC = document.getElementById('inpSenhaConfirm');
    var iptToken = document.getElementById('inpToken');

    inpEmail.style = "border: #9E9E9E solid 1px;";
    iptSenha.style = "border: #9E9E9E solid 1px;";
    iptSenhaC.style = "border: #9E9E9E solid 1px;";
    iptToken.style = "border: #9E9E9E solid 1px;";
}