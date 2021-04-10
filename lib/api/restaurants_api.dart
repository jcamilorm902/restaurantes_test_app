import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurantes_test_app/models/restaurant.dart';
import 'package:restaurantes_test_app/utils/CustomException.dart';
import 'package:restaurantes_test_app/utils/constants.dart';

class RestaurantsApi {
  RestaurantsApi._internal();

  static Future<List<Restaurant>> getByCity(String cityName) async {
    List<Restaurant> restaurants = [];

    final response = await http.get(
        Uri.parse('${Constants.restaurantsApiBase}/fields?address=$cityName'),
        headers: {
          'X-API-KEY': Constants.restaurantsApiKey,
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response);
      final parsedResponse = jsonDecode(response.body);
      restaurants = (parsedResponse['data'] as List).map((e) => Restaurant.fromJson(e)).toList();
    } else {
      throw CustomException(
          'Error conectando el API para buscar Restaurantes.');
    }

    return restaurants;
  }
}
