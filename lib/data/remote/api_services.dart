
import 'dart:convert';

import 'package:http/http.dart';
import 'package:summer_iti_api_bloc/model/base_exception.dart';
import 'package:summer_iti_api_bloc/model/weather.dart';
import 'package:http/http.dart' as http;
import '../Constants.dart';

class ApiServices {
  static ApiServices? _apiServices;

  ApiServices._instance();

  factory ApiServices() {
    if (_apiServices == null) {
      _apiServices = ApiServices._instance();
    }
    return _apiServices!;
  }


  Future<WeatherResponse>? getWeather(String cityName) async {
    String url =
        "${Constants.BASE_URL}/current?access_key=${Constants.API_KEY}&query=$cityName";
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String body = response.body;
      print(body);
      return WeatherResponse.fromJson(jsonDecode(body));
    } else {
      throw BaseException.statusCode(response.statusCode);
    }
  }
}
