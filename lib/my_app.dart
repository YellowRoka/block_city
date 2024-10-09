import 'package:block_city/di/providers/providers.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:        'Weather App',
      routerConfig: appRouterProvider.router,
    );
  }
}
