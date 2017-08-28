var sum = 0;
i = 0;
var limit = 1000;
var mult = [3,5];

for (i; i < limit; i++ ) {
	if (i % mult[0] === 0 || i % mult[1] === 0) {
		sum += i;
	}
}
console.log(sum);

