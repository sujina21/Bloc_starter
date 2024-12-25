import 'package:bloc_test/cubit/speed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeedView extends StatefulWidget {
  const SpeedView({super.key});

  @override
  State<SpeedView> createState() => _SpeedViewState();
}

class _SpeedViewState extends State<SpeedView> {
  @override
  Widget build(BuildContext context) {
    final _distanceController = TextEditingController();
    final _timeController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Speed Calculation'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _distanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Distance(in metres)",
                ),
              ),
              TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Time(in seconds)",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final distance =
                      double.tryParse(_distanceController.text) ?? 0;
                  final time = double.tryParse(_timeController.text) ?? 0;
                  context.read<SpeedCubit>().calculateSpeed(distance, time);
                },
                child: Text('Calculate'),
              ),

              
              BlocBuilder<SpeedCubit,double >
                  (builder: (context, speed) => Text('Speed: $speed m/s'),),
            ],
          ),
        ));
  }
}
