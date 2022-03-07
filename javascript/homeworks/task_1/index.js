/////////////////////////  Ex. 1 | Start
// Declare 2 variables a and b, such that a > b,
// and define values for them. Output their
// a. sum
// b. difference (between a and b)
// c. product
// d. quotient (between a and b)
// e. remainder (between a and b)

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

/////////////////////////  Ex. 1 | End

/////////////////////////  Ex. 2 | Start
// Print your name and age in the following format: “My name is ____, I am ____ .”

// let name = "Vahe";
// let age = 22;
// console.log(`My name is ${name}, I am ${age} years old`);

/////////////////////////  Ex. 2 | End

/////////////////////////  Ex. 3 | Start
// Swap 2 variables, without using any other variables.

// let a = 8;
// let b = 12;
// console.log(a, b);

// a = a + b;
// b = a - b;
// a = a - b;

// console.log(a, b);

/////////////////////////  Ex. 3 | End

/////////////////////////  Ex. 4 | Start
// Declare a variable with defined value. Print the last digit of the number.

// let a = -122;
// console.log(a % 10);

/////////////////////////  Ex. 4 | End

/////////////////////////  Ex. 5 | Start
// Check whether a given number is negative. Print “yes”, if it is negative, print “no” otherwise.

// function is_negative(n) {
//   if (n > 0) {
//     console.log("No");
//   } else {
//     console.log("Yes");
//   }
// }
// is_negative(0)
// is_negative(2)
// is_negative(-2)

///////////////////////// Ex. 5 | End

/////////////////////////  Ex. 6 | Start
// Declare variable. Initialize it with the value, which shows temperature in degrees Celsius.
// Print its equivalent in degrees Fahrenheit.
// To convert temperatures in degrees Celsius to Fahrenheit use the following formula: °C * 1.8 +32 = °F .

// let degree_c = 20;
// let degree_f = degree_c * 1.8 + 32;
// console.log(degree_f);

/////////////////////////  Ex. 6 | End

/////////////////////////  Ex. 7 | Start
// For a given three digit number calculate the sum of its digits.

// function sum_of_digits(num) {
//   let sum = 0;

//   while (num) {
//     sum += num % 10;
//     num = Math.floor(num / 10);
//   }
//   return sum;
// }

// console.log(sum_of_digits(306));

/////////////////////////  Ex. 7 | End

/////////////////////////  Ex. 8 | Start
// Given two numbers print 1 if one of them is divisible by the other one, otherwise print 0.

// let a = 18;
// let b = 2;

// if (a % b == 0 || b % a == 0) {
//   console.log(1);
// } else {
//   console.log(0);
// }

/////////////////////////  Ex. 8 | End

/////////////////////////  Ex. 9 | Start
// Given any number between 1 and 12. Print the name of the respective month.

// function get_month(num) {
//   const MONTHS = Object.freeze({
//     1: "January",
//     2: "February",
//     3: "March",
//     4: "April",
//     5: "May",
//     6: "June",
//     7: "July",
//     8: "August",
//     9: "September",
//     10: "October",
//     11: "November",
//     12: "December",
//   });

//   return MONTHS[num];
// }

// console.log(get_month(5));

/////////////////////////  Ex. 9 | End

/////////////////////////  Ex. 10 | Start
// Given three numbers. Find the maximum one.

// let [a, b, c] = [-4, 6, 9870];

// max = a;
// if (b > max && b > c) {
//   max = b;
// } else if (c > max && c > b) {
//   max = c;
// }

// console.log(max);
// console.log(Math.max(1020, 500, -450));

/////////////////////////  Ex. 10 | End

/////////////////////////  Ex. 11 | Start
// Given a number. Print its absolute value.

// let num = -123;
// console.log(Math.abs(num));

/////////////////////////  Ex. 11 | End

/////////////////////////  Ex. 12 | Start
// Given a number. Print “odd” if the number is odd and “even” if it’s even.

// let num = 12;
// let is_odd_or_even = num % 2 == 0 ? console.log("even") : console.log("odd");

/////////////////////////  Ex. 12 | End

/////////////////////////  Ex. 13 | Start
// Declare three variables. Two of them are the bounds of a range. Print “In bounds”,
// if the third number is in the range, otherwise print “Out of bounds”.

// let [a, b, c] = [-12, 9, 13];
// if (c > a && c < b) {
//   console.log("In bounds");
// } else {
//   console.log("Out of bounds");
// }

/////////////////////////  Ex. 13 | End

/////////////////////////  Ex. 14 | Start
// Given three sides of a triangle. Check whether the triangle is valid or not.
// Print “yes” if it is valid and “no" otherwise.
// (Triangle is valid if the sum of its two sides are greater than the third side).

// let [a, b, c] = [2, 3, 5];

// if (a + b > c) {
//   console.log("Yes");
// } else {
//   console.log("No");
// }

/////////////////////////  Ex. 14 | End

/////////////////////////  Ex. 15 | Start
// Given a number. Determine whether it consists of 2 digits
// and whether the first digit is greater than the second one. Print “yes” if it is, otherwise print “no”.

// let num = 32;

// if (String(num)[0] > String(num)[1]) {
//   console.log("Yes");
// } else {
//   console.log("No");
// }

/////////////////////////  Ex. 15 | End

/////////////////////////  Ex. 16 | Start
// Given a number round it to the nearest 50 without using “if” operator (conditions).
// The easy way to get integer part after division is Math.round(a / k).

let num = 124;
num = num / 50;
out = Math.round(num) * 50;
console.log(out);

/////////////////////////  Ex. 16 | End
