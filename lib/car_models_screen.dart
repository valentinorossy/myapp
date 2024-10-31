// lib/car_models_screen.dart

import 'package:flutter/material.dart';
import 'car_api_service.dart';

class CarModelsScreen extends StatelessWidget {
  final String make;
  final CarApiService _carApiService = CarApiService();

  CarModelsScreen({required this.make});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Models for $make')),
      body: FutureBuilder<List<String>>(
        future: _carApiService.fetchCarModels(make),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final models = snapshot.data!;
          return ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) {
              final model = models[index];
              return ListTile(title: Text(model));
            },
          );
        },
      ),
    );
  }
}
