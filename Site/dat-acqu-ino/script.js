var valoresRandom = [];
var maxSetor = 15;
var minSetor = 5

function reduzir(num, numA) {
    return result = numA + num;
}

// function aumentar(num, numA) {
//     return result = numA - 5;
// }

setInterval(function geraValores() {
    valoresRandom.push(parseInt(Math.random(0, 1).toFixed()));
    var pessoas = valoresRandom.reduce(reduzir);

    if (pessoas < minSetor) {
        console.log('Pouco fluxo');
    }
    else if (pessoas < maxSetor) {
        console.log(`${pessoas} pessoas no setor`);
    }
    else if (pessoas == maxSetor) {
        console.log('SUPERLOTAÇÃO!');
    }
}, 1000)

