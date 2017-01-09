var myString = "Some random string";
var output = ""

for(i = myString.length - 1; i >=0; i-- ) {
  output += myString[i];
}
console.log(output)