var limit = prompt("Enter the limit for Fibonacci sequence");

var fibPast = 0;
var fibBeforeCurrent = 1 ;
var fibCurrent = 1;
var sum = 0;

while(fibCurrent < limit) {
  if(fibCurrent % 2 === 0) {
    sum += fibCurrent;
  }
  fibPast = fibBeforeCurrent;
  fibBeforeCurrent = fibCurrent;
  fibCurrent = fibPast + fibBeforeCurrent;
}
console.log(sum);