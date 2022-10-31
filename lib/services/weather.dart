import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/location.dart';
import 'package:clima/network.dart';
const apikey = '0c8ac163ad1dac6c85390d656238c38a';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future getCityWeather(String cityName)async{
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?q=$cityName&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
