import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/simple_interest_cubit.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  _SimpleInterestViewState createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Interest Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: principalController,
                decoration:
                    const InputDecoration(labelText: 'Principal Amount'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: rateController,
                decoration:
                    const InputDecoration(labelText: 'Rate of Interest (%)'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Time (Years)'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final principal =
                    double.tryParse(principalController.text) ?? 0;
                final rate = double.tryParse(rateController.text) ?? 0;
                final time = double.tryParse(timeController.text) ?? 0;
                context
                    .read<SimpleInterestCubit>()
                    .calculateInterest(principal, rate, time);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 195, 255, 44)),
              ),
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) => Text(
                'Simple Interest: $interest',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
