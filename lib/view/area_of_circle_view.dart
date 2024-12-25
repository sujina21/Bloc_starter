import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/area_of_circle_cubit.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Area of Circle')),
      body: Column(
        children: [
          TextField(
            controller: radiusController,
            decoration: InputDecoration(labelText: 'Radius'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              final radius = double.tryParse(radiusController.text) ?? 0;
              context.read<AreaOfCircleCubit>().calculateArea(radius);
            },
            child: Text('Calculate'),
          ),
          BlocBuilder<AreaOfCircleCubit, double>(
            builder: (context, area) => Text('Area: $area'),
          ),
        ],
      ),
    );
  }
}
