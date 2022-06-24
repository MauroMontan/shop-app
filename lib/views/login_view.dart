import 'package:flutter/material.dart';
import "package:shop_app/widgets/widgets.dart" show LoginBackground;

class LoginView extends StatelessWidget {
  static const String routeName = "LoginView";
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          LoginBackground(),
        ],
      ),
    );
  }
}
