import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/pages/search_page.dart';
import 'package:flutter_bloc_example/pages/settings_page.dart';
import 'package:flutter_bloc_example/repositories/weather_api_client.dart';
import 'package:flutter_bloc_example/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather() async{
    final weatherRepository = WeatherRepository(
      weatherApiClient: WeatherApiClient(httpClient: http.Client()),
    );

    final weather = await weatherRepository.getWeather('seoul');
    print('weather in seoul: ${weather.toJson()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return SettingsPage();
                        }
                    )
                );
              }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return SearchPage();
                      }
                  )
              );
              print('city: $city');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Text('London',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('2020-08-02T15:00:00',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('15', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('maxTemp: 17', style: TextStyle(fontSize: 16),),
                  Text('minTemp: 10', style: TextStyle(fontSize: 16),)
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Text('Light Cloud',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),)
        ],
      ),
    );
  }


}
