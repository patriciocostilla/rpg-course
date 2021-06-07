function square(x1) {
    x1[0] = x1[0] * x1[0];
    return x1;
}

let x = [2];
let n = square(x);
console.log(x[0], "al cuadrado es:", n[0])

