
import 'dart:convert';

import 'package:weatherapp_flutter/model/weather_current.dart';
import 'package:weatherapp_flutter/model/weather_daily.dart';
import 'package:weatherapp_flutter/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_flutter/model/weather_hourly.dart';
import 'package:weatherapp_flutter/utils/api_url.dart';

class FetchWeather{
  WeatherData? weatherData;

  Future<WeatherData> processData(lat,lon) async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherHourly.fromJson(jsonString),
      WeatherCurrent.fromJson(jsonString), 
      WeatherDaily.fromJson(jsonString));

    return weatherData!;
  }
}

