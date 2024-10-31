// lib/car_api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class CarApiService {
  static const String _baseUrl = "https://vpic.nhtsa.dot.gov/api/vehicles";

  Future<List<String>> fetchCarMakes() async {
    final response = await http.get(Uri.parse("$_baseUrl/GetAllMakes?format=json"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final makesList = data['Results'] as List<dynamic>;
      return makesList.map((make) => make['Make_Name'].toString()).toList();
    } else {
      throw Exception('Failed to load car makes');
    }
  }

  Future<List<String>> fetchCarModels(String make) async {
    final response = await http.get(Uri.parse("$_baseUrl/GetModelsForMake/$make?format=json"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final modelsList = data['Results'] as List<dynamic>;
      return modelsList.map((model) => model['Model_Name'].toString()).toList();
    } else {
      throw Exception('Failed to load car models');
    }
  }
}
