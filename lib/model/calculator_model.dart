enum Operand { add, subtract, multiply, divide }

class CalculatorModel {
  double num1 = 0.0;
  double num2 = 0.0;
  Operand? operand;

  String calculate(String output) {
    num2 = double.parse(output);
    switch (operand) {
      case Operand.add:
        return (num1 + num2).toString();
      case Operand.subtract:
        return (num1 - num2).toString();
      case Operand.multiply:
        return (num1 * num2).toString();
      case Operand.divide:
        return (num1 / num2).toString();
      default:
        return output;
    }
  }

  void setOperand(String op) {
    switch (op) {
      case "+":
        operand = Operand.add;
        break;
      case "-":
        operand = Operand.subtract;
        break;
      case "X":
        operand = Operand.multiply;
        break;
      case "/":
        operand = Operand.divide;
        break;
    }
  }

  void clear() {
    num1 = 0.0;
    num2 = 0.0;
    operand = null;
  }
}
