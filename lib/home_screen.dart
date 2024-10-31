// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'car_api_service.dart';
import 'car_models_screen.dart';

class HomeScreen extends StatelessWidget {
  final CarApiService _carApiService = CarApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car Makes')),
      body: FutureBuilder<List<String>>(
        future: _carApiService.fetchCarMakes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final makes = snapshot.data!;
          return ListView.builder(
            itemCount: makes.length,
            itemBuilder: (context, index) {
              final make = makes[index];
              return ListTile(
                title: Text(make),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarModelsScreen(make: make),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
