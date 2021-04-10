import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_test_app/providers/restaurants_provider.dart';

class SearchRestaurantsField extends StatefulWidget {
  @override
  _SearchRestaurantsFieldState createState() => _SearchRestaurantsFieldState();
}

class _SearchRestaurantsFieldState extends State<SearchRestaurantsField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Buscar Restaurantes:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Boston',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: _handelSearch,
            child: Text('Buscar'),
          ),
        ),
      ],
    );
  }

  Future<void> _handelSearch() async {
    final restaurantsProvider = Provider.of<RestaurantsProvider>(context, listen: false);
    restaurantsProvider.getByCity(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
