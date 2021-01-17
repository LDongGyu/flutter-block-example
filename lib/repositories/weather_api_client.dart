import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient{
  static const String baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<int> getLocationId(String city) async{
    final String url = '$baseUrl/api/location/search/?query=$city';

    final http.Response response = await httpClient.get(url);

    if(response.statusCode != 200){
      throw Exception('Can not get locationId of $city');
    }

    final responseBody = json.decode(response.body);

    print('woeid: ${responseBody[0]['woeid']}');

    return responseBody[0]['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final url = '$baseUrl/api/location/$locationId';
    final http.Response response = await httpClient.get(url);

    if(response.statusCode != 200){
      throw Exception('Can not get weather of the city with locationId: $locationId');
    }

    final responseBody = json.decode(response.body);
    final Weather weather = Weather.fromJson(responseBody);
    print(weather.toJson());

    return weather;
  }
}