import 'package:block_city/features/splash/splash_ui_body.dart';
import 'package:flutter/material.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashUIBody()
      ),
    );
  }
}
