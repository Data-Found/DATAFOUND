// alert fale conosco
function alertForm(msg) {
    Swal.fire({
        icon: 'error',
        title: 'Campo inválido!',
        text: msg,
    })
}

function alertContact() {
    Swal.fire({
        position: 'center',
        icon: 'success',
        title: 'Sua mensagem foi enviada!',
        showConfirmButton: false,
        timer: 1500
      })
}

// alerts dashboard
function dashYellowAlerts(msg) {
        Swal.fire({
        icon: 'warning',
        title: 'Atenção',
        text: msg,
    })
}

function dashRedAlerts(msg) {
        Swal.fire({
        icon: 'error',
        title: 'Perigo',
        text: msg,
    })
}