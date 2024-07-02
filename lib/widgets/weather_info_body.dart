import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoBody({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.condition),
          getThemeColor(weatherModel.condition)[300]!,
          getThemeColor(weatherModel.condition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${weatherModel.temp.round()}',
                  style: TextStyle(
                      fontFamily: 'Handlee-Regular',
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '°',
                  style: TextStyle(
                      fontFamily: 'Handlee-Regular',
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  height: 130,
                  width: 130,
                  child: Image.network(
                    'https:${weatherModel.image}',
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: 40,
                ),
                Text(
                  weatherModel.cityName,
                  style: TextStyle(
                      fontFamily: 'Handlee-Regular',
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                weatherModel.condition,
                style: TextStyle(
                    fontFamily: 'Handlee-Regular',
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Text(
                  '${weatherModel.maxTemp.round()}/${weatherModel.minTemp.round()}',
                  style: TextStyle(
                      fontFamily: 'Handlee-Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'feels like: ${weatherModel.feelsLike.round()}',
                  style: TextStyle(
                      fontFamily: 'Handlee-Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(
                    fontFamily: 'Handlee-Regular',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 30),
              child: Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Icon(Icons.air_outlined),
                          Text(
                            'Wind',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weatherModel.wind.round()} kph',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 2,
                        height: 75,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Icon(Icons.water_drop_outlined),
                          Text(
                            'Humidity',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weatherModel.humidity}%',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 2,
                        height: 75,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Icon(WeatherIcons.rain),
                          Text(
                            'Rain',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weatherModel.rainChance}%',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 30),
              child: Container(
                height: 110,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Icon(WeatherIcons.sunrise),
                          Text(
                            'Sunrise',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weatherModel.sunRise}',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        color: Colors.grey,
                        width: 2,
                        height: 75,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Icon(WeatherIcons.sunset),
                          Text(
                            'Sunset',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${weatherModel.sunSet}',
                            style: TextStyle(
                                fontFamily: 'Handlee-Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
