var number = 600851475143;
var i = 1;

while (number != i) {
    if (number % i === 0) {
       number /= i;
       i=1;
    }
    i += 1;
}

console.log(number);