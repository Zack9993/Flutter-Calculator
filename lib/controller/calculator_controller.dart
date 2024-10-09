import 'package:myapp/model/calculator_model.dart';

class CalculatorController {
  final CalculatorModel model;
  String output = "0";
  String _output = "0";

  CalculatorController(this.model);

  void buttonPressed(String buttonText, Function updateView) {
    if (buttonText == "CLEAR") {
      model.clear();
      _output = "0";
    } else if (["+", "-", "/", "X"].contains(buttonText)) {
      model.num1 = double.parse(output);
      model.setOperand(buttonText);
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      _output = model.calculate(output);
      model.clear(); // Reset for the next calculation
    } else {
      _output += buttonText;
    }

    output = double.parse(_output).toStringAsFixed(2);
    updateView();
  }
}
