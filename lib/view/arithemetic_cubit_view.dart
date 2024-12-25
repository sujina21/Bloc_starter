import 'package:flutter/material.dart';

class ArithmeticCubitView extends StatefulWidget {
  const ArithmeticCubitView({super.key});

  @override
  _ArithmeticCubitViewState createState() => _ArithmeticCubitViewState();
}

class _ArithmeticCubitViewState extends State<ArithmeticCubitView> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = "";

  void _add() {
    final num1 = double.tryParse(_firstNumberController.text) ?? 0;
    final num2 = double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = (num1 + num2).toString();
    });
  }

  void _subtract() {
    final num1 = double.tryParse(_firstNumberController.text) ?? 0;
    final num2 = double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = (num1 - num2).toString();
    });
  }

  void _multiply() {
    final num1 = double.tryParse(_firstNumberController.text) ?? 0;
    final num2 = double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = (num1 * num2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Cubit View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _add,
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _subtract,
                  child: Text('Sub'),
                ),
                ElevatedButton(
                  onPressed: _multiply,
                  child: Text('Mul'),
                ),
              ],
            ),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
