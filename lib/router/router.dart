import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:shop_app/views/views.dart';

class AppRouter {
  static String initialRoute = LoginView.routeName;

  static Map<String, Widget Function(BuildContext)> routes = {
    LoginView.routeName: (_) => const LoginView(),
  };
}
