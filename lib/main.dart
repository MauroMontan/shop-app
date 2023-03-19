import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Themes/theme.dart';
import 'package:shop_app/router/router.dart';
import 'package:shop_app/services/product_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      title: 'shop app',
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
