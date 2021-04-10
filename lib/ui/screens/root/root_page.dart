import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_test_app/providers/global_provider.dart';
import 'package:restaurantes_test_app/ui/screens/auth/auth.dart';
import 'package:restaurantes_test_app/ui/screens/home/home.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalProvider = Provider.of<GlobalProvider>(context);

    return globalProvider.isLoggedUser ? HomePage() : AuthPage();
  }
}
