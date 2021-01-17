import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/weather.dart';
import 'package:flutter_bloc_example/repositories/weather_api_client.dart';

class WeatherRepository{
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient}): assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async{
    print('city in getWeather: $city');
    final int locationId = await weatherApiClient.getLocationId(city);
    print('locationId: $locationId');
    weatherApiClient.fetchWeather(locationId);
  }
}