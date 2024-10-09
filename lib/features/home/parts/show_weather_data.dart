import 'package:block_city/features/home/parts/weather_data_line.dart';
import 'package:block_city/repostiry/model/weather_model.dart';
import 'package:flutter/material.dart';

class ShowWeatherData extends StatefulWidget {
  final WeatherModel weather;
  const ShowWeatherData( this.weather, {super.key});

  static const double kelvinConst = 273.15;

  @override
  State<ShowWeatherData> createState() => _ShowWeatherDataState();
}

class _ShowWeatherDataState extends State<ShowWeatherData> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync:           this, 
      duration:        const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _controller,
      child:   SizedBox(
        width:  ((width > 500 ) ? 500 : width) * 0.8,
        child: Card(
          elevation: 10,
          color:     Colors.blue,
          child:     Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize:      MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherDataLine( label: 'City:',    data: widget.weather.name ),
                WeatherDataLine( label: 'Temp:',    data:'${(widget.weather.main.temp-ShowWeatherData.kelvinConst).ceilToDouble().toString()} °C' ),
                WeatherDataLine( label: 'Weather:', data: widget.weather.weather.first.main ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
