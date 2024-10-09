import 'dart:developer';

import 'package:block_city/repostiry/model/request_model.dart';

import 'package:block_city/repostiry/model/weather_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class OpenWeatherDioApi {
  //https://api.openweathermap.org/data/2.5/weather?
  //lat=$%7Bevent.latitude%7D&lon=$%7Bevent.longitude%7D&appid=$apiKey&units=metric%27
  final url = 'https://api.openweathermap.org/data/2.5/weather';
  final dio = Dio();
  
  OpenWeatherDioApi(){
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody:   false,
      )
    );
  }

  Future<WeatherModel?> getData( {required String lat, required String lon} ) async {
    try {
      final apiKey          = dotenv.env['API_KEY']!.toString();
      RequestModel request = RequestModel(
        lat:    lat,
        lon:    lon,
        apiKey: apiKey,
      );
      final requestJson = request.toJson();
      final response    = await dio.get(
        url, 
        queryParameters: requestJson,
      );

      return WeatherModel.fromJson(response.data);
    }
    
    catch(e) {
      log('Error: $e');
      return null;
    }
  }
}
