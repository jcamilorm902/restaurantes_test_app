import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_test_app/providers/restaurants_provider.dart';
import 'package:restaurantes_test_app/ui/widgets/logout_button.dart';
import 'package:restaurantes_test_app/ui/widgets/search_restaurants_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
        actions: [
          LogoutButton(iconSize: 20),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ChangeNotifierProvider(
          create: (_) => RestaurantsProvider(),
          child: Column(
            children: [
              SearchRestaurantsField(),
              Flexible(
                flex: 1,
                child:
                    Consumer<RestaurantsProvider>(builder: (ctx, provider, _) {
                  return ListView(
                    children: provider.restaurants
                        .map((e) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(e.phone),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
