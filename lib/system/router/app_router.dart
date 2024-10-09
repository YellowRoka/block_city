import 'package:block_city/features/home/home_ui.dart';
import 'package:block_city/features/splash/splash_ui.dart';
import 'package:block_city/system/router/routes.dart';
import 'package:block_city/system/router/transtaion_animations/fade_transtaion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';



@injectable
class AppRouter {
  
  Future<void> goToRoute(String routeName, {Object? extra} )            async => await router.push(routeName, extra: extra);
  Future<void> goToRouteWithReplace(String routeName, {Object? extra} ) async => await router.replace(routeName, extra: extra);
  void goBack() => router.pop();

  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation:     Routes.splashPage,
    routes:          <RouteBase>[

      GoRoute(
        path:        Routes.splashPage,
        pageBuilder: (BuildContext context, GoRouterState state) => const NoTransitionPage<void>(child: SplashUI() ),
        routes:      const <RouteBase>[],
      ),

      GoRoute(
        path:        Routes.homePage,
        pageBuilder: (BuildContext context, GoRouterState state) => const FadeTransitionPage<void>(child: HomeUI() ),
        routes:      const <RouteBase>[],
      ),


    ],

    errorPageBuilder: (context, state) => const NoTransitionPage<void>( child: Text('Page not exist!') ),
  );
}
