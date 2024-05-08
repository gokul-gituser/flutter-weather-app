import 'package:weatherapp_flutter/model/weather_current.dart';
import 'package:weatherapp_flutter/model/weather_daily.dart';
import 'package:weatherapp_flutter/model/weather_hourly.dart';

class WeatherData{
  final WeatherCurrent? current;
  final WeatherHourly? hourly;
  final WeatherDaily? daily;

  WeatherData([this.hourly, this.current, this.daily]);

  WeatherCurrent getCurrentWeather() => current!;
  WeatherHourly getHourlyWeather() => hourly!;
  WeatherDaily getDailyWeather() => daily!;

}