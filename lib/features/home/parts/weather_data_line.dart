import 'package:flutter/material.dart';

class WeatherDataLine extends StatelessWidget {
  final String label;
  final String data;
  const WeatherDataLine({super.key, required this.label, required this.data});

  final textStyle = const TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Flexible(
          flex: 1,
          child: Text( 
            label, 
            style:    textStyle,
            overflow: TextOverflow.clip, 
            maxLines: 2,
          ),
        ),
        
        Flexible(
          flex: 2,
          child: Text( 
            data,
            style:    textStyle, 
            overflow: TextOverflow.clip, 
            maxLines: 2,
          ),
        ),
      
      ],
    );
  }
}
