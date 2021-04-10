import 'package:flutter/material.dart';
import 'package:restaurantes_test_app/ui/widgets/logout_button.dart';

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
    );
  }
}
