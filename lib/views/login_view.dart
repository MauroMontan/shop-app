import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/login_form_provider.dart';
import 'package:shop_app/widgets/login_form.dart';
import "package:shop_app/widgets/widgets.dart" show LoginBackground;

class LoginView extends StatelessWidget {
  static const String routeName = "LoginView";
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 240),
            ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: const LoginForm(),
            ),
          ],
        ),
      )),
    );
  }
}
