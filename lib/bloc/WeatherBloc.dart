import 'package:bloc/bloc.dart';
import 'package:summer_iti_api_bloc/bloc/WeatherEvent.dart';
import 'package:summer_iti_api_bloc/bloc/WeatherState.dart';
import 'package:summer_iti_api_bloc/data/remote/api_services.dart';
import 'package:summer_iti_api_bloc/model/base_exception.dart';
import 'package:summer_iti_api_bloc/model/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  ApiServices? _apiServices;

  WeatherBloc(WeatherState initialState, this._apiServices)
      : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    switch (event) {
      case WeatherEvent.FETCH_WEATHER:
        try {
          WeatherResponse? weatherResponse =
              await _apiServices!.getWeather('New York');
          yield SuccessWeatherState(weatherResponse);
        } catch (e) {
          yield ErrorWeatherState(BaseException(message: e.toString()));
        }
    }
  }
}
