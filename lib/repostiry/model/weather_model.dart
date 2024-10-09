import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';
@freezed
class WeatherModel with _$WeatherModel{
  const factory WeatherModel({
    required String        name,
    required List<Weather> weather,
    required Main          main,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@freezed
class Weather with _$Weather{
  const factory Weather({
    required String main,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Main with _$Main{
  const factory Main({
    required double temp,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}
