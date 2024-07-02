import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;
  getweather({required String cityName}) async {
    emit(WeatherIsLoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getForecastWeather(cityName: cityName);
      emit(WeatherIsLoadedState(weatherModel!));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error!, please try later';
      throw (errorMessage);
    } catch (e) {
      throw ('Oops there was an error!, please try later');
    }
  }
}
