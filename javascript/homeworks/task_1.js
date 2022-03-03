// //  task 1
// let a = 14;
// let b = 5;

// sum = a + b;
// difference = a - b;
// product = a * b;
// quotient = a / b;
// remainder = a % b;

// console.log(sum);
// console.log(difference);
// console.log(product);
// console.log(quotient);
// console.log(remainder);
// /////////////////////////////////////////////////////////

// // task 2
// let name = "Vahe";
// let age = 22;
// console.log(`My name is ${name}, I am ${age} years old`);
// /////////////////////////////////////////////////////////

// // task 3
// let a = 8;
// let b = 12;
// console.log(a, b);

// a = a + b;
// b = a - b;
// a = a - b;

// console.log(a, b);
// /////////////////////////////////////////////////////////

// // task 4
// let a = -122;
// console.log(a % 10);
// /////////////////////////////////////////////////////////

// // task 5
// let a = 12;

// if (a >= 0) {
//   console.log("No");
// } else {
//   console.log("Yes");
// }
// /////////////////////////////////////////////////////////

// // task 6
// let degree_c = 20;
// let degree_f = degree_c * 1.8 + 32;
// console.log(degree_f);

// // task 7
// let num = 912;
// let sum_of_digits = 0;

// for (let i = 0; i < num.toString().length; i++) {
//   sum_of_digits += +num.toString()[i];
// }

// console.log(sum_of_digits);
// /////////////////////////////////////////////////////////

// // task 8
// let a = 18;
// let b = 2;

// if (a % b == 0 || b % a == 0) {
//   console.log(1);
// } else {
//   console.log(0);
// }

// // task 9
// num = 7;
// let month = [
//   "January",
//   "February",
//   "March",
//   "April",
//   "May",
//   "June",
//   "July",
//   "August",
//   "September",
//   "October",
//   "November",
//   "December",
// ];

// for (let i = 0; i <= month.length; i++) {
//   if (i == num) {
//     console.log(month[i - 1]);
//     break;
//   }
// }
// /////////////////////////////////////////////////////////

// // task 10
// let [a, b, c] = [-4, 6, 9870];

// max = a;
// if (b > max && b > c) {
//   max = b;
// } else if (c > max && c > b) {
//   max = c;
// }

// console.log(max);
// console.log(Math.max(1020, 500, -450));
// /////////////////////////////////////////////////////////

// // task 11
// let num = -123;
// console.log(Math.abs(num));
// /////////////////////////////////////////////////////////

// // task 12
// let num = 12;
// let is_odd_or_even = num % 2 == 0 ? console.log("even") : console.log("odd");
// /////////////////////////////////////////////////////////

// // task 13
// let [a, b, c] = [-12, 9, 13];
// if (c > a && c < b) {
//   console.log("In bounds");
// } else {
//   console.log("Out of bounds");
// }
// /////////////////////////////////////////////////////////

// // task 14
// let [a, b, c] = [2, 3, 5];

// if (a + b > c) {
//   console.log("Yes");
// } else {
//   console.log("No");
// }
// /////////////////////////////////////////////////////////

// // task 15
// let num = 32;

// if (String(num)[0] > String(num)[1]) {
//   console.log("Yes");
// } else {
//   console.log("No");
// }
// /////////////////////////////////////////////////////////

// task 16
let num = 124;
num = num / 50;
out = Math.round(num) * 50;
console.log(out);
