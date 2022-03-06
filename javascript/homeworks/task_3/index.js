/////////////////////////  Ex. 1 | Start
// Print numbers from 10 to 1.

// for (let i = 10; i > 0; i--) {
//     console.log(i);
// }

/////////////////////////  Ex. 1 | End

/////////////////////////  Ex. 2 | Start
// Given a number print its digits count.

// function count_of_digits(num) {
//   let count = 0;

//   while (num) {
//     count++;
//     num = Math.floor(num / 10);
//   }
//   return count;
// }

// console.log(count_of_digits(6586787));

/////////////////////////  Ex. 2 | End

/////////////////////////  Ex. 3 | Start
// Count numbers of digit 9 in a number.

// function count_of_nines(num) {
//   return String(num).split("9").length - 1;
// }

// console.log(count_of_nines(659978799924));

/////////////////////////  Ex. 3 | End

/////////////////////////  Ex. 4 | Start
// Given two numbers. Print powers of 2 between that numbers.
// (without using Math.pow)

// function my_pow(num1, num2) {
//   for (let i = 0; i < num2; i++) {
//     pow = 2 ** i;

//     // break loop if power of 2 bigger than my number
//     if (pow > num2) {
//       break;
//     }

//     if (pow > num1 && pow < num2) {
//       console.log(pow);
//     }
//   }
// }

// my_pow(0, 350);

/////////////////////////  Ex. 4 | End

/////////////////////////  Ex. 5 | Start
// Given a number as input, insert dashes (-) between each two even numbers.

// function add_dashes(num) {
//   // Convert number to string
//   num = String(num);
//   let num_with_dashes = [num[0]];

//   for (let i = 1; i < num.length; i++) {
//     if (num[i - 1] % 2 === 0 && num[i] % 2 === 0) {

//       // If number is even, than add dash to array
//       num_with_dashes.push("-", num[i]);
//     } else {
//       num_with_dashes.push(num[i]);
//     }
//   }
//   console.log(num_with_dashes.join(""));
// }

// add_dashes(25468);

/////////////////////////  Ex. 5 | End

/////////////////////////  Ex. 6 | Start
// An Armstrong number is a 3 digit number for which sum of cube of its digits is equal to the number itself.
// Write a program to check whether the given number is an Armstrong number.

// function armstrong_number(n) {
//   let sum = 0;
//   let digit = 0;
//   temp = n;
//   while (temp > 0) {
//     digit = temp % 10;
//     sum += digit ** 3;
//     temp = Math.floor(temp / 10);
//   }

//   if (n == sum) {
//     console.log(n, "Yes");
//   } else {
//     console.log(n, "No");
//   }
// }

// armstrong_number(153);

/////////////////////////  Ex. 6 | End

/////////////////////////  Ex. 7 | Start
// Given a positive number. Print it in reverse order.

// function reverse(num) {
//   let sum = 0;
//   let digit = 0;
//   while (num > 0) {
//     digit = num % 10;
//     sum = sum * 10 + digit;
//     num = parseInt(num / 10);
//   }

//   return sum;
// }
// console.log(reverse(123456789));
/////////////////////////  Ex. 7 | End

/////////////////////////  Ex. 8 | Start
// Insert a number. Print “yes” if it contains 3 successive zeros, otherwise print “no”.

// function three_zeros(num) {
//   let arr = [];
//   let dig = 0;
//   // Get each digit and add into array
//   while (num) {
//     dig = num % 10;
//     num = Math.floor(num / 10);
//     arr.push(dig);
//   }

//   // Check if array contains 3 successive zeros
//   let count = 0;
//   for (let n of arr) {
//     if (n == 0) {
//       count++;
//     } else {
//       count = 0;
//     }
//     if (count == 3) {
//       return "Yes";
//     }
//   }

//   return "No";
// }

// console.log(three_zeros(350120003));

/////////////////////////  Ex. 8 | End

/////////////////////////  Ex. 9 | Start
// A perfect number is a positive integer that is equal to the sum of its proper positive divisors.
// Print all perfect numbers between 1 and 500.

// function perfect_number(num) {
//   let sum = 0;
//   for (let i = 1; i < num; i++) {
//     if (num % i == 0) {
//       sum += i;
//     }
//   }

//   if (sum == num) {
//     console.log(num);
//   }
// }

// for (let i = 1; i < 500; i++) {
//   perfect_number(i);
// }

/////////////////////////  Ex. 9 | End

/////////////////////////  Ex. 10 | Start
// Insert a number. Remove all zeros from the number, except the last one and print the number.
// If there are at most one zero, print “Nothing to remove”.

// function remove_zeros(n) {
//   // Crteate list from my number
//   let list = n.toString().split("");

//   if (list.filter((el) => el === "0").length < 2) {
//     return "Nothing to remove!";
//   }
//   return +list
//     .filter((el, i, arr) => el !== "0" || i === arr.lastIndexOf(el))
//     .join("");
// }

// console.log(remove_zeros(45120));

/////////////////////////  Ex. 10 | End

/////////////////////////  Ex. 11 | Start
// Given a number n (0 ≤ n ≤ 100) you should print the smallest positive number
// such that its digits product is equal to n.

// function smallest_number(n) {
//   if (n >= 0 && n <= 9) {
//     return n;
//   }

//   let digits = [];

//   for (let i = 9; i >= 2 && n > 1; i--) {
//     while (n % i == 0) {
//       digits.push(i);
//       n = Math.floor(n / i);
//     }
//   }

//   if (n != 1) {
//     return -1;
//   }

//   let k = 0;
//   while (digits.length != 0) {
//     k = k * 10 + digits[digits.length - 1];
//     digits.pop();
//   }

//   return k;
// }

// console.log(smallest_number(81));

/////////////////////////  Ex. 11 | End

/////////////////////////  Ex. 12 | Start
// Insert a n positive number. Print the n-st prime number.

// function primeMover(n) {
//   let primes = [2];
//   let x = 3;
//   let count = 0;
//   do {
//     for (let y = 2; y < x; y++) {
//       if (x % y === 0) {
//         count++;
//       }
//     }
//     if (count === 0) {
//       primes.push(x);
//       x++;
//     } else {
//       x++;
//       count = 0;
//     }
//   } while (primes.length < n);

//   return primes[primes.length - 1];
// }
// console.log(primeMover(10000));

/////////////////////////  Ex. 12 | End

/////////////////////////  Ex. 13 | Start
// Insert two positive integers n and m between 1 and 10. Compute and print  nm.

// function my_pow(num, pow) {
//   let res = 0;
//   for (let i = 0; i < pow; i++) {
//     res = num ** pow;
//   }

//   return res;
// }
// console.log(my_pow(4, 5));

/////////////////////////  Ex. 13 | End

/////////////////////////  Ex. 14 | Start
// Find the biggest common divisor of two inserted numbers.

// function gcd_of_two_numbers(x, y) {
//   while (y) {
//     let t = y;
//     y = x % y;
//     x = t;
//   }
//   return x;
// }

// console.log(gcd_of_two_numbers(12, 24));

/////////////////////////  Ex. 14 | End

/////////////////////////  Ex. 15 | Start
// Given a number. Print all prime factors of the number.

// function prime_factors(n) {
//   let factors = [];
//   let divisor = 2;

//   while (n >= 2) {
//     if (n % divisor == 0) {
//       factors.push(divisor);
//       n = n / divisor;
//     } else {
//       divisor++;
//     }
//   }
//   return factors;
// }

// n = 420;
// console.log(`Prime factors of ${n}: are ${prime_factors(n).join(" ")}`);

/////////////////////////  Ex. 15 | End

/////////////////////////  Ex. 16 | Start
// Enter a positive number. Calculate and print its factorial.

// function factorial(n) {
//   if (n < 2) {
//     return 1;
//   }

//   return n * factorial(n - 1);
// }

// console.log(factorial(5));

/////////////////////////  Ex. 16 | End

/////////////////////////  Ex. 17 | Start
// Enter a number. Reverse its first and last digits. Print the new number.
// Done in task_2/Ex 11

/////////////////////////  Ex. 17 | End

/////////////////////////  Ex. 18 | Start
// Given a number n ( n >= 0 ). Print n Fibonacci number.

// function fibonacci(n) {
//     if (n < 2) {
//         return n;
//     }
//     return fibonacci(n - 1) + fibonacci(n - 2)
// }

// console.log(fibonacci(20));

/////////////////////////  Ex. 18 | End

/////////////////////////  Ex. 19 | Start
// Given a number n ( n > 0 ). Print Fibonacci series up to n.

// function fibonacci_series(num) {
//   let n1 = 0;
//   let n2 = 1;
//   let next = 0;

//   while (next <= num) {
//     console.log(next);
//     n1 = n2;
//     n2 = next;
//     next = n1 + n2;
//   }
// }

// fibonacci_series(45);
/////////////////////////  Ex. 19 | End

/////////////////////////  Ex. 20 | Start
// Print the following number pattern:

// let row = 7;
// let i, j;
// // First part
// for (i = 1; i <= row; i++) {
//   for (j = 1; j <= i; j++) {
//     document.write(j);
//   }
//   document.write("<br>");
// }

// // Second part
// for (i = row - 1; i >= 1; i--) {
//   for (j = 1; j <= i; j++) {
//     document.write(j);
//   }
//   document.write("<br>");
// }

/////////////////////////  Ex. 20 | End

/////////////////////////  Ex. 21 | Start
// Write a program, to calculate the value of the following sequence:
// 1 - 1/3 + 1/5 - 1/7 + 1/9 + ….. + * 1/n .

// function calc_sequence(n) {
//   let sum = 0;
//   let t = 1;

//   for (let i = 1; i <= 2 * n - 1; i += 2) {
//     sum = sum + (1 / i) * t;
//     t = -1 * t;
//   }
//   return sum;
// }

// console.log(calc_sequence(50)); // ~ PI/4
// console.log(Math.PI / 4);

/////////////////////////  Ex. 21 | End

/////////////////////////  Ex. 22 | Start
// Write a program which will give you all of the potential combinations
// of a two-digit decimal combination, printed in a comma delimited format
// ‘00’, ‘01’, ‘02’, …, ‘98’, ‘99’

// for (let i = 0; i < 10; i++) {
//   for (let j = 0; j < 10; j++) {
//     i = String(i);
//     j = String(j);
//     process.stdout.write(i);
//     process.stdout.write(j);
//     process.stdout.write(", ");
//   }
//   console.log("");
// }

/////////////////////////  Ex. 22 | End

/////////////////////////  Ex. 23 | Start
// Write a program to check the validity of password input by users.
// Validation:
// • At least 1 letter between [a-z] and 1 letter between [A-Z].
// • At least 1 number between [0-9].
// • At least 1 character from [$#@].
// • Minimum length 6 characters.
// • Maximum length 16 characters.

// function password_validation(password) {
//   let validated = true;
//   if (password.length < 6) {
//     validated = false;
//     console.log("Password length must be atleast 6 characters");
//   }
//   if (password.length > 16) {
//     validated = false;
//     console.log("Password length must not exceed 16 characters");
//   }

//   if (!/[a-z]/.test(password)) {
//     validated = false;
//     console.log("Must contain at least one lowercase letter");
//   }

//   if (!/[A-Z]/.test(password)) {
//     validated = false;
//     console.log("Must contain at least one uppercase letter");
//   }

//   if (!/[0-9]/.test(password)) {
//     validated = false;
//     console.log("Must contain at least one number");
//   }
//   if (!/[$#@]/.test(password)) {
//     validated = false;
//     console.log("Must contain at least one character from [$#@]");
//   }

//   validated ? console.log("Valid") : console.log("Invalid");
//   console.log("--------------------------------------");
// }

// password_validation("12asdf");
// password_validation("Aaza1234566#");

/////////////////////////  Ex. 23 | End

/////////////////////////  Ex. 24 | Start
// Write a program to print X star pattern series using loop.

function x_pattern(row) {
  for (let i = 0; i <= row; i++) {
    for (let j = 0; j <= row; j++) {
      if (i == j || i + j == row) {
        process.stdout.write("*");
      } else {
        process.stdout.write(" ");
      }
    }
    console.log("");
  }
}
x_pattern(20);

/////////////////////////  Ex. 24 | End
