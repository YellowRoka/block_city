import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync:    this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width:  90,
      child:  CustomPaint(
        size:    const Size(60, 60), // no effect while adding child
        painter: LoadingCircularPaint( progressValue: _controller.value ),
        child:   const Center(
          child: Icon( Icons.circle, size: 40, color: Colors.transparent ),
        ),
      ),
    );
  }
}

double deg2rad(double deg) => deg * math.pi / 180;

class LoadingCircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;

  LoadingCircularPaint({
    this.borderThickness = 8.0,
    required this.progressValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect   = Rect.fromCenter(center: center, width: size.width, height: size.height);
/*
    Paint paint = Paint()
      ..color       = Colors.grey.withAlpha(100)
      ..style       = PaintingStyle.stroke
      ..strokeCap   = StrokeCap.round
      ..strokeWidth = borderThickness;

    //grey background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );
*/
    Paint progressBarPaint = Paint()
      ..style       = PaintingStyle.stroke
      ..strokeCap   = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader      = RadialGradient(
        //focalRadius: 0.0,
        //radius:      progressValue,
        stops: [progressValue, 0],
        
        tileMode: TileMode.decal,
          colors: [
          Colors.white.withOpacity(1-progressValue),
          Colors.white.withOpacity(progressValue),
        ],
      ).createShader(rect);
      /*..shader      = LinearGradient(
          begin: Alignment.center,
          end:   Alignment.center,
          colors: [
            Colors.white.withOpacity(progressValue),
            Colors.white.withOpacity(1-progressValue),
          ],
        ).createShader(rect);*/

    canvas.drawArc(
      rect,
      deg2rad(360 * progressValue),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
