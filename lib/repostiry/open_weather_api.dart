import 'dart:convert';
import 'dart:developer';

import 'package:block_city/repostiry/model/request_model.dart';
import 'package:http/http.dart' as http;

import 'package:block_city/repostiry/model/weather_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


@injectable
class OpenWeatherApi {
  //https://api.openweathermap.org/data/2.5/weather?
  //lat=$%7Bevent.latitude%7D&lon=$%7Bevent.longitude%7D&appid=$apiKey&units=metric%27
  final url    = Uri.https('api.openweathermap.org','/data/2.5/weather');
  final client = http.Client();
  

  Future<WeatherModel?> getData(RequestModel request) async {
    try {
      final apiKey          = dotenv.env['API_KEY']!.toString();
      final extentedRequest = request.copyWith(apiKey: apiKey);
      final requestJson     = extentedRequest.toJson();
      final response        = await client.post(
        url, 
        body: requestJson,
      );
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    }
    
    catch(e) {
      log('Error: $e');
      return null;
    }
  }
}
