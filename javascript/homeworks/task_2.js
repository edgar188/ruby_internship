// // task 1 Done
// // task 2 Done

// // task 3
// let num = 17;
// let a = String(num) + String(num * 2) + String(num * 3);
// console.log(a);
// /////////////////////////////////////////////////////////

// // task 4
// let num = 1002;
// let last_digit = num % 10;

// if (last_digit == 0) {
//   console.log(num);
// } else {
//   console.log(Number(String(last_digit) + String(num).slice(0, -1)));
// }
// /////////////////////////////////////////////////////////

// // task 5
// function get_average(a, b, c, d, e) {
//   sum = 0;
//   sum += a + b + c + d + e;
//   return sum / 5;
// }

// console.log(get_average(45, -12, 0, 3, -15));
// console.log(get_average(7, 52, -23, 9, -81));
// /////////////////////////////////////////////////////////

// // task 6
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
// /////////////////////////////////////////////////////////

// // task 7
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

// mult(14, 5, 0); // error
// mult(-8, 9, -6); // +
// mult(8, 9, 6); // +
// mult(4, 19, -2); // -
// mult(-4, -19, -2); // -
// /////////////////////////////////////////////////////////

// // task 8
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
// console.log("----------------");
// quadratic_eq(0, 4, -5);
// console.log("----------------");
// quadratic_eq(3, -8, 12);
// console.log("----------------");
// quadratic_eq(5, -13, 6);
// /////////////////////////////////////////////////////////

// // task 9
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
// /////////////////////////////////////////////////////////

// // task 10
// function is_num_contains_dig(dig, num) {
//   if (String(num).includes(String(dig))) {
//     console.log("Yes");
//   } else {
//     console.log("No");
//   }
// }

// is_num_contains_dig(8, 4231);
// /////////////////////////////////////////////////////////

// // task 11
// let num = 408;

// if (String(num).length == 1) {
//   console.log(num);
// } else {
//   let first = String(num)[0];
//   let last = String(num).slice(-1);
//   new_num = +(last + String(num).slice(1, -1) + first);

//   console.log(num);
//   console.log(new_num);
// }
// /////////////////////////////////////////////////////////

// // task 12
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
// /////////////////////////////////////////////////////////

// // task 13
function difference(n) {
  let biggest = 0;
  let smallest = 9;
  while (n) {
    let r = n % 10;

    biggest = Math.max(r, biggest);
    smallest = Math.min(r, smallest);
    n = parseInt(n / 10);
  }

  result = biggest - smallest;
  console.log(result);
}

difference(5);
difference(152);
difference(4593653);
