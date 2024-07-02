import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final String baseUrl = 'PUT YOUR BASE URL';
  final String apiKey = 'PUT YOUR API KEY';
  final Dio dio;
  WeatherService(this.dio);

  Future<WeatherModel> getForecastWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } catch (e) {
      throw 'Oops there was an error! try later';
    }
  }
}
