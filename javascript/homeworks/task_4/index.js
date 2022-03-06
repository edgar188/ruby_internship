/////////////////////////  Ex. 1 | Start
// Insert a number. Print ‘yes’ if the number is prime, ‘no’ otherwise.

// function is_n_prime(n) {
//   let isPrime = true;

//   if (n == 1) {
//     return;
//   } else if (n > 1) {
//     for (let i = 2; i < n; i++) {
//       if (n % i == 0) {
//         isPrime = false;
//         break;
//       }
//     }

//     if (isPrime) {
//       console.log(`${n} is a prime number`);
//     } else {
//       console.log(`${n} is a not prime number`);
//     }
//   }
// }

// is_n_prime(63);
// is_n_prime(401);

/////////////////////////  Ex. 1 | End

/////////////////////////  Ex. 2 | Start
// Given a number ​ n ( n>= 0 ) ​ . Print ​ n t h Fibonacci number.

// Done in task_3/Ex 18

/////////////////////////  Ex. 2 | End

/////////////////////////  Ex. 3 | Start
// Given a number ​ n( n> 0 ) ​ . Print Fibonacci series up to ​ n . ​

// Done in task_3/Ex 19

/////////////////////////  Ex. 3 | End

/////////////////////////  Ex. 4 | Start
// Insert a number. Calculate product and sum of the digits of the number. If product is
// divisible by the sum, print the quotient, otherwise print the remainder.

// function calc(num) {
//   let sum = 0;
//   let prod = 1;

//   if (num == 0) {
//     console.log("Cannot calculate");
//     return;
//   }

//   while (num) {
//     sum += num % 10;
//     prod *= num % 10;
//     num = Math.floor(num / 10);
//   }

//   if (prod % sum == 0) {
//     console.log("Quotient is: ", prod / sum);
//   } else {
//     console.log("Remainder is: ", prod % sum);
//   }
// }

// calc(1233);
// calc(5);
// calc(0);
// calc(455);

/////////////////////////  Ex. 4 | End

/////////////////////////  Ex. 5 | Start
// Given three numbers ​ a, b ​ (a ≤ b) and num.
// Create an array of evenly spaced numbers
// by the given ​ num​ length over the specified interval (from ​ a ​ to ​ b).

// function range(low, up, leng) {
//   let arr = [];
//   let step = (up - low) / parseFloat(leng);

//   for (let i = 0; i < leng; i++) {
//     arr.push(low);
//     low = low + step;
//   }

//   return arr;
// }
// console.log(range(1, 5, 1));
// console.log(range(10, 100, 3));
// console.log(range(1, 5, 6));

/////////////////////////  Ex. 5 | End

/////////////////////////  Ex. 6 | Start
// Given an array of numbers. Find the index of the second maximum element.

// function second_largest_number(nums) {
//   // Complete the function
//   var largest = nums[0];
//   for (let i = 1; i < nums.length; ++i) {
//     if (nums[i] > largest) largest = nums[i];
//   }
//   var large;
//   var index = 0;

//   //To ensure that the selected number is not the largest
//   for (let j = 0; j < nums.length; ++j) {
//     if (nums[j] !== largest) {
//       large = nums[j];
//       break;
//     }
//   }

//   for (let j = 1; j < nums.length; ++j) {
//     if (large < nums[j] && nums[j] != largest) {
//       large = nums[j];
//       index = j;
//     }
//   }

//   return index;
// }

// a = [23, -98, 0, -456, 12, 8];
// b = [-60, 2, 43, -18, 5, -19, 36, 7, 56];
// console.log(second_largest_number(a));
// console.log(second_largest_number(b));

/////////////////////////  Ex. 6 | End

/////////////////////////  Ex. 7 | Start
// Given an array of numbers, padding amount and repeat count. Pad the array in the
// following way: the padding amount specifies how many elements should be taken from
// the array edges, the repeat amount specifies how many times the pad should be
// repeated. Also, you should check that ​ padding amount <= length of array.

function repeat_array_items(arr, pad_amount, n) {
  if (pad_amount > arr.length) {
    console.log("Invalid padding amount");
    return -1;
  }
  let begin_value = arr.slice(0, pad_amount);
  let end_values = arr.slice(-pad_amount);

  for (var i = 0; i < n; i++) {
    arr = arr.slice().reverse().concat(begin_value).reverse();
    arr = arr.concat(end_values);
  }

  return arr;
}

let a = [1, 2, 3, 4];
console.log(repeat_array_items(a, 1, 3));
