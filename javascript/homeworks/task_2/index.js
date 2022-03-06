/////////////////////////  Ex. 1 | Done
/////////////////////////  Ex. 2 | Done

/////////////////////////  Ex. 3 | Start
// Given number ​ n ​ (positive integer). Print the value of ​ n + nn + nnn ​ (not multiplication)​

// function digit_concatenation(num) {
//   let res = String(num) + String(num * 2) + String(num * 3);
//   return res;
// }

// console.log(digit_concatenation(17));

/////////////////////////  Ex. 3 | End

/////////////////////////  Ex. 4 | Start
// Given a positive integer. Bring the last digit of the number to the beginning.
// Print the new number. If the last digit of the inserted number is 0, number remains the same.

// function swap_first_and_last_digits(num) {
//   let last_digit = num % 10;

//   if (last_digit == 0) {
//     return num;
//   } else {
//     return Number(String(last_digit) + String(num).slice(0, -1));
//   }
// }

// console.log(swap_first_and_last_digits(100));

/////////////////////////  Ex. 4 | End

/////////////////////////  Ex. 5 | Start
// Given five numbers as input.
// Calculate and print the average of the numbers(without using arrays).

// function get_average(a, b, c, d, e) {
//   sum = 0;
//   sum += a + b + c + d + e;
//   return sum / 5;
// }

// console.log(get_average(45, -12, 0, 3, -15));
// console.log(get_average(7, 52, -23, 9, -81));

/////////////////////////  Ex. 5 | End

/////////////////////////  Ex. 6 | Start
// Given three numbers. Sort them by the ascending order.

// function sort(a, b, c) {
//   if (a < b && a < c) {
//     console.log(a);
//     if (b < c) {
//       console.log(b);
//       console.log(c);
//     }
//   } else if (b < c && b < a) {
//     console.log(b);
//     if (c < a) {
//       console.log(c);
//       console.log(a);
//     }
//   } else if (c < a && c < b) {
//     console.log(c);
//     if (a < b) {
//       console.log(a);
//       console.log(b);
//     }
//   }
// }

// sort(3, 6, -111);

/////////////////////////  Ex. 6 | End

/////////////////////////  Ex. 7 | Start
// Find the sign of product of three numbers ​ without ​ multiplication operator.
// Display the specified sign.

// function mult(a, b, c) {
//   if (a == 0 || b == 0 || c == 0) {
//     console.log("Unsigned");
//   } else if (
//     (a < 0 && b > 0 && c > 0) ||
//     (b < 0 && a > 0 && c > 0) ||
//     (c < 0 && a > 0 && b > 0) ||
//     (a < 0 && b < 0 && c < 0)
//   ) {
//     console.log("-");
//   } else {
//     console.log("+");
//   }
// }

// mult(14, 5, 0);    // Error
// mult(-8, 9, -6);   // +
// mult(8, 9, 6);     // +
// mult(4, 19, -2);   // -
// mult(-4, -19, -2); // -

/////////////////////////  Ex. 7 | End

/////////////////////////  Ex. 8 | Start
// Input three numbers ​ a ​ , ​ b , ​ ​ c ​ respectively, where a is a non zero number
// and write a program to solve quadratic equations: ax 2 + bx + c = 0 .

// function quadratic_eq(a, b, c) {
//   let D = b * b - 4 * a * c;

//   if (a == 0) {
//     console.log("Enter valid constants");
//     return;
//   }
//   if (D > 0) {
//     let x1 = (-b + Math.sqrt(D)) / (2 * a);
//     let x2 = (-b - Math.sqrt(D)) / (2 * a);
//     console.log(`Solutions are ${x1} and ${x2} `);
//   } else if (D == 0) {
//     x1 = -b / (2 * a);
//     console.log("x = ", x1);
//   } else {
//     console.log("Solution does not exists");
//   }
// }

// quadratic_eq(1, 2, 1);
// quadratic_eq(0, 4, -5);
// quadratic_eq(3, -8, 12);
// quadratic_eq(5, -13, 6);

/////////////////////////  Ex. 8 | End

/////////////////////////  Ex. 9 | Start
// Given the following code rewrite it using only two ​ if ​ operators.

// let n = 25;
// let i = 0;
// let j = 0;

// if (n % 2 == 0 && !Math.floor(n / 10)) {
//   i += 1;
//   console.log(i);
// }

// if (n % 3 == 0 && n % 10 == 1) {
//   j += 1;
//   console.log(j);
// }

/////////////////////////  Ex. 9 | End

/////////////////////////  Ex. 10 | Start
// Insert a digit and a number.
// Check whether the digits contains in the number or not.

// function is_num_contains_dig(dig, num) {
//   if (String(num).includes(String(dig))) {
//     alert("Yes");
//   } else {
//     alert("No");
//   }
// }

// let dig = +prompt("Please insert a digit: ");
// let num = +prompt("Please insert a number: ");
// is_num_contains_dig(dig, num);

/////////////////////////  Ex. 10 | End

/////////////////////////  Ex. 11 | Start
// Enter a number. Reverse its first and last digits. Print the new number.

// function swap_first_and_last_digits(num) {
//   if (String(num).length == 1) {
//     alert(num);
//   } else {
//     let first = String(num)[0];
//     let last = String(num).slice(-1);
//     new_num = +(last + String(num).slice(1, -1) + first);

//     alert(`before: ${num}, now: ${new_num}`);
//   }
// }

// let num = +prompt("Please insert a number: ");
// swap_first_and_last_digits(num);

/////////////////////////  Ex. 11 | End

/////////////////////////  Ex. 12 | Start
// Write a program which will compute the area of a rectangular or a triangle after
// prompting the user to type the name of the figure name. Also check that entered
// numbers are positive.
// For the triangle entered numbers are height and and base.

// function area_of_rect_or_triangle(form, a, b) {
//   if (a <= 0 || b <= 0) {
//     alert("Please enter only positives!");
//     return;
//   }

//   if (form == "T" || form == "triangle") {
//     alert(`Square of the triangle is ${(1 / 2) * (a * b)}`);
//   } else if (form == "R" || form == "rectangle") {
//     alert(`Square of the rectangle is ${a * b}`);
//   }
// }

// let form = prompt("Please write form name(T/triangle or R/rectangle)");
// let a = +prompt("Please write 1 number: ");
// let b = +prompt("Please write 2 number: ");

// area_of_rect_or_triangle(form, a, b);

/////////////////////////  Ex. 12 | End

/////////////////////////  Ex. 13 | Start
// Enter a number. Find the difference between its biggest and smallest digits.

function difference(n) {
  let biggest = 0;
  let smallest = 9;
  while (n) {
    let r = n % 10;

    biggest = Math.max(r, biggest);
    smallest = Math.min(r, smallest);
    n = parseInt(n / 10);
  }

  diff = biggest - smallest;
  return diff;
}

let num = +prompt("Please insert a number: ");

alert(
  `difference beetwen smallest and biggest digits of ${num} is ${difference(
    num
  )}`
);

/////////////////////////  Ex. 13 | End
