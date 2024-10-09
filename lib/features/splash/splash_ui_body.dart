import 'package:block_city/di/providers/providers.dart';
import 'package:block_city/features/splash/parts/unique_animated_icon.dart';
import 'package:block_city/system/router/routes.dart';
import 'package:flutter/material.dart';

class SplashUIBody extends StatelessWidget{
  

  const SplashUIBody({super.key});

  @override
  Widget build(BuildContext context) {
    const bigTextStily   = TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold );
    const smallTextStily = TextStyle( fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic );
    
    return Container(
      width:      MediaQuery.of(context).size.width,
      height:     MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient( 
          begin: Alignment.topLeft,
          end:   Alignment.bottomRight,
          colors: [
            Colors.blue.shade100,
            Colors.blue.shade300,
            Colors.blue.shade600,
            Colors.blue.shade900,
          ],
        )
      ),
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text( 'Weather App for Block City', style: bigTextStily   ),
          const Text( 'created by: Fox',            style: smallTextStily ),

          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UniqueAnimatedIcon(
                icon:    Icons.circle,
                latency: Duration( milliseconds: 0),
              ),
              const UniqueAnimatedIcon(
                icon:    Icons.cloud,
                latency: Duration( milliseconds: 700),
              ),
              const UniqueAnimatedIcon(
                icon:    Icons.thunderstorm_rounded,
                latency: Duration( milliseconds: 1000),
              ),
              UniqueAnimatedIcon(
                icon:       Icons.ac_unit_rounded,
                latency:    const Duration( milliseconds: 1100),
                onFinished: () => appRouterProvider.goToRouteWithReplace(Routes.homePage),
              ),
            ],
          ),
        ],
      )
    );
  }
}
