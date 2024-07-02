import 'package:weather_app/model/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherIsLoadingState extends WeatherStates {}

class WeatherIsLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherIsLoadedState(this.weatherModel);
}

//class WeatherFailureStates extends WeatherStates {}
