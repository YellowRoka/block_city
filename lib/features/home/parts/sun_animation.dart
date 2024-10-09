import 'package:flutter/material.dart';

class SunAnimation extends StatefulWidget {
  const SunAnimation({super.key});

  @override
  State<SunAnimation> createState() => _SunAnimationState();
}

class _SunAnimationState extends State<SunAnimation> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync:           this, 
      duration:        const Duration(seconds: 3),
      reverseDuration: const Duration(seconds: 3),
    )..value = 0.2;

    _controller.forward();
    _controller.addListener(
      (){
        if(_controller.value == _controller.upperBound){
          _controller.reverse();
        }
        else if(_controller.value < 0.2){
          _controller.forward();
        }
        else{ }
        setState(() {});
      }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width:  100,
      decoration: BoxDecoration(
        color: Colors.amber.shade600,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow( 
            color:      Colors.amber.shade600,//.withOpacity( ), 
            spreadRadius: 20 * _controller.value, 
            blurRadius:   50 * _controller.value,
          )
        ]
      ),
    );
  }
}
