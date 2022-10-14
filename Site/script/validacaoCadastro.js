function defaultColor(){
    inpEmail.style = " border: 1px solid #9E9E9E ;"
    inpSenha.style = " border: 1px solid #9E9E9E ;"
   }
   function validaInputLogin() {
       var email = inpEmail.value;
       var senha = inpSenha.value;
   
       if (email == '') {
           inpEmail.style = "border:1px solid red;"
           alert("Digite um email no primeiro campo")
       } else if (email.includes("@") == false) {
           inpEmail.style = "border:1px solid red;"
           alert("Email invalido: não contem @")
       }else if (senha == '') {
           inpSenha.style = "border:1px solid red;"
           alert("Digite uma senha no primeiro campo")
       }else if(email == "adm@datafound.com" && senha == "1234"){
           window.location.href = "dashboard.html"
       }else{
           alert("Usuario e email invalido");
       }
   }