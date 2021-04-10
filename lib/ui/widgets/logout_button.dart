import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantes_test_app/providers/global_provider.dart';

class LogoutButton extends StatelessWidget {
  final double iconSize;
  final Color color;

  LogoutButton({
    Key key,
    this.iconSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.logout),
        iconSize: iconSize,
        color: color,
        onPressed: () {
          final globalProvider =
              Provider.of<GlobalProvider>(context, listen: false);
          globalProvider.logout();
        });
  }
}
