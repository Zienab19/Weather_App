import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  final MaterialColor themeColor;

  const HomeView({super.key, required this.themeColor});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.themeColor,
        title: Text(
          'Weather Forecast',
          style: TextStyle(
              fontFamily: 'Handlee-Regular',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchView()));
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeather();
          } else if (state is WeatherIsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherIsLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return Text('Oops there was an error!, please try later');
          }
        },
      ),
    );
  }
}
