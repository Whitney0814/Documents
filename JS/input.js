/* 입력
let fs = require('fs');
let input = fs.readFileSync('dev/stdin').toString().split(' ');

console.log(input[0] * 1 + input[1] * 1);
*/
/*
let fs = require('fs');
let input = fs.readFileSync('dev/stdin').toString().split(' ');
input[0] = input[0] * 1;
input[1] = input[1] * 1;
if(input[0] === input[1]){
    console.log("==");
}else if(input[0] > input[1]){
    console.log(">");
}else{
    console.log("<");
}
*/
/*
let fs = require('fs');
let input = fs.readFileSync('dev/stdin').toString().split(' ');
input[0] = input[0] * 1;

if(100 >= input[0] && 90 <= input[0]){
    console.log("A");
}
else if(89 >= input[0] && 80 <= input[0]){
    console.log("B");
}
else if(79 >= input[0] && 70 <= input[0]){
    console.log("C");
}
else if(69 >= input[0] && 60 <= input[0]){
    console.log("D");
}
else{
    console.log("F");
}
*/
/*
let fs = require('fs');
let input = fs.readFileSync('dev/stdin').toString().split(' ');
input[0] = input[0] * 1;

if(input[0] % 4 === 0 && input[0] % 100 !== 0 || input[0] % 400 === 0){
    console.log("1");
}else{
    console.log("0");
}
*/
