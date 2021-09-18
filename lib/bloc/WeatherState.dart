import 'package:summer_iti_api_bloc/model/base_exception.dart';
import 'package:summer_iti_api_bloc/model/weather.dart';

class WeatherState {}

class LoadingWeatherState extends WeatherState {}

class ErrorWeatherState extends WeatherState {
  BaseException? baseException;
  ErrorWeatherState(this.baseException);
}

class SuccessWeatherState extends WeatherState {
  WeatherResponse? weatherResponse;
  SuccessWeatherState(this.weatherResponse);
}
