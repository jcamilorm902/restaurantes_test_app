class Restaurant {
  final String name;
  final String phone;

  Restaurant({this.name, this.phone});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json["restaurant_name"],
      phone: json["restaurant_phone"],
    );
  }
}
