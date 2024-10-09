import 'package:flutter/material.dart';

class UniqueAnimatedIcon extends StatefulWidget {
  final IconData      icon;
  final Duration      latency;
  final VoidCallback? onFinished;

  const UniqueAnimatedIcon({super.key, required this.icon, required this.latency, this.onFinished});

  @override
  State<UniqueAnimatedIcon> createState() => _UniqueAnimatedIconState();
}

class _UniqueAnimatedIconState extends State<UniqueAnimatedIcon> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  final iconSize = 70.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _controller.addListener(
      () async{
        setState(() {});
        if(_controller.value == _controller.upperBound){
          await Future.delayed( const Duration(seconds: 1) );
          if(widget.onFinished != null){
            widget.onFinished!();
          }
          
        }
      }
    );
    Future.delayed(widget.latency).then((value) => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      color: Colors.white.withOpacity(_controller.value),
      size:  iconSize,
    );
  }
}
