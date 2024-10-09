import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CalculatorModel model = CalculatorModel();
  late CalculatorController controller;

  @override
  void initState() {
    super.initState();
    controller = CalculatorController(model);
  }

  void updateView() {
    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => controller.buttonPressed(buttonText, updateView),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                controller.output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ]),
                Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X")
                ]),
                Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ]),
                Row(children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+")
                ]),
                Row(children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}