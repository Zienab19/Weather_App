class WeatherModel{
  
  final String cityName;
  final DateTime date;
  final double temp;
  final double feelsLike;
  final double maxTemp;
  final double minTemp;
  final int rainChance;
  final double wind;
  final int humidity;
  final String image;
  final String condition;
  final String sunRise;
  final String sunSet;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.temp,
      required this.feelsLike,
      required this.maxTemp,
      required this.minTemp,
      required this.rainChance,
      required this.wind,
      required this.humidity,
      required this.image,
      required this.condition,
      required this.sunRise,
      required this.sunSet});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
      feelsLike: json['current']['feelslike_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      rainChance: json['forecast']['forecastday'][0]['day']
          ['daily_chance_of_rain'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      sunRise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunSet: json['forecast']['forecastday'][0]['astro']['sunset'],
    );
  }
}

