import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class  FadeTransitionPage<T> extends CustomTransitionPage<T>{
  const FadeTransitionPage({
    super.key,
    required super.child,
  }) : super(
    transitionsBuilder:        _transitionsBuilder,
    transitionDuration:        const Duration(seconds: 3),
    reverseTransitionDuration: const Duration(seconds: 2),
  );

  static Widget _transitionsBuilder(
    BuildContext      context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget            child
  ){
    return FadeTransition(
      opacity: animation,
      child:   child,
    );
  }
}
