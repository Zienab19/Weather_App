import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              var themeColor = getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition
              
              );

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: themeColor,
                ),
                home: HomeView(themeColor: themeColor,),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light drizzle':
    case 'Light rain shower':
    case 'Light sleet':
    case 'Light sleet showers':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Patchy light snow with thunder':
    case 'Light snow showers':
    case 'Light showers of ice pellets':
    case 'Patchy light rain with thunder':
    case 'Moderate rain':
      return Colors.lightBlue;

    case 'Cloudy':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;

    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy freezing rain':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow':
    case 'Moderate or heavy snow showers':
    case 'Moderate or heavy showers of ice pellets':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Overcast':
      return Colors.grey;
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Heavy snow':
    case 'Ice pellets':
      return Colors.indigo;
    default:
      return Colors.blue; // Default color if condition is unknown
  }
}
