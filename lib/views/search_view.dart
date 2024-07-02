import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Forecast',
          style: TextStyle(
              fontFamily: 'Handlee-Regular',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getweather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.all(25),
              hintText: 'Search A City',
              hintStyle: TextStyle(
                  fontFamily: 'Handlee-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              labelText: 'Search',
              labelStyle: TextStyle(
                  fontFamily: 'Handlee-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
