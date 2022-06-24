import 'package:flutter/material.dart';
import 'package:shop_app/router/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'shop app',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
