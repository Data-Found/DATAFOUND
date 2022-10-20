function defaultColor() {
    inpNomeEmpresa.style = " border: 1px solid #9E9E9E ;"
    inpCNPJ.style = " border: 1px solid #9E9E9E ;"
    inpEmail.style = " border: 1px solid #9E9E9E ;"
    inpSenha.style = " border: 1px solid #9E9E9E ;"
    inpSenhaConfirm.style = " border: 1px solid #9E9E9E ;"
    inpNumero.style = " border: 1px solid #9E9E9E ;"
    inpTipo.style = "border: 1px solid #9E9E9E ;"
}
function validaInputLogin() {
    var nomeEmpresa = inpNomeEmpresa.value;
    var cnpj = inpCNPJ.value;
    var email = inpEmail.value;
    var senha = inpSenha.value;
    var senhaC = inpSenhaConfirm.value;
    var numero = inpNumero.value;
    var cep = inpCep.value;
    var resp = inpResponsavel.value;
    var username = inpNomeUsuario.value;
    var tipo = inpTipo.value;



    if (nomeEmpresa == "") {
        inpNomeEmpresa.style = "border:1px solid red;";
        alert("Digite o nome da empresa");
    } else if (cnpj == "") {
        inpCNPJ.style = "border:1px solid red;";
        alert("Digite o CNPJ");
    } else if (email == "") {
        inpEmail.style = "border:1px solid red;";
        alert("Digite o email");
    } else if (email.includes("@") == false) {
        inpEmail.style = "border:1px solid red;";
        alert("Email invalido: não contem @");
    }
    else if (senha == "") {
        inpSenha.style = "border:1px solid red;";
        alert("Digite a senha");
    } else if (senhaC == "") {
        inpSenhaConfirm.style = "border:1px solid red;";
        alert("Por favor confirme a senha");
    } else if (senha != senhaC) {
        inpSenhaConfirm.style = "border:1px solid red;";
        inpSenha.style = "border:1px solid red;";
        alert("As senhas não coincidem")
    }else if(numero == ""){
        inpNumero.style = "border:1px solid red;";
        alert("Digite o Numero");
    } else if (cep.includes(".") == true || cep.includes("-") == true) {
        inpCep.style = "border:1px solid red;";
        alert("Digite o cep sem incluir ponto ou simbolos especiais");
    } else if (resp == "") {
        inpResponsavel.style = "border:1px solid red;";
        alert("Digite um responsavel");
    } else if (username == "") {
        inpNomeUsuario.style = "border:1px solid red;";
        alert("Digite um nome de usuario!");
    } else if (tipo == "0") {
        inpTipo.style = "border:1px solid red;";
        alert("Selecione uma das outras opções");
    } else {
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
}