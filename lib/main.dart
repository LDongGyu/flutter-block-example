import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter_bloc.dart';
import 'package:flutter_bloc_example/cubits/weather_cubit.dart';
import 'package:flutter_bloc_example/pages/home_page.dart';
import 'package:flutter_bloc_example/repositories/weather_api_client.dart';
import 'package:flutter_bloc_example/repositories/weather_repository.dart';
import 'package:flutter_bloc_example/simple_cubit_observer.dart';
import 'package:http/http.dart' as http;

import 'cubits/settings_cubit.dart';

void main() {
  Bloc.observer = SimpleCubitObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const MyApp({Key key, this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) =>
              WeatherCubit(weatherRepository: weatherRepository),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}