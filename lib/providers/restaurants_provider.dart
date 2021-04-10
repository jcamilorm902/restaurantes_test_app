import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:restaurantes_test_app/api/restaurants_api.dart';
import 'package:restaurantes_test_app/models/restaurant.dart';

class RestaurantsProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => UnmodifiableListView(_restaurants);

  Future<void> getByCity(String cityName) async {
    _restaurants = await RestaurantsApi.getByCity(cityName);
    notifyListeners();
  }
}