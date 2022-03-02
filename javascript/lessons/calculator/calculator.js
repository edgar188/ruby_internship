// Calculator
let calc = {
  a: 0,
  b: 0,

  read() {
    this.a = prompt("Input 1 number: ");
    this.b = prompt("Input 2 number: ");
  },

  sum() {
    return +this.a + +this.b;
  },

  mult() {
    return +this.a * +this.b;
  },
};

calc.read();
console.log(`Sum of ${calc.a} and ${calc.b} = `, calc.sum());
console.log(`Mult of ${calc.a} and ${calc.b} = `, calc.mult());
