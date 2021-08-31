// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));


class RxWeather {
  final RxInt id;
  final RxInt temp;
  final RxString city;
  final RxString weatherIcon;
  final RxString tempMessage;

  RxWeather(
      {required this.id,
      required this.temp,
      required this.city,
      required this.weatherIcon,
      required this.tempMessage});
}

class Weather {
  late RxWeather rx;

  Weather({
    required int id,
    required int temp,
    required String city,
  }) {
    String weatherIcon = getWeatherIcon(id);
    String tempMessage = getMessage(temp);
    this.rx = RxWeather(
        id: id.obs,
        temp: temp.obs,
        city: city.obs,
        weatherIcon: weatherIcon.obs,
        tempMessage: tempMessage.obs);
  }

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        temp: json["temp"].toInt(),
        city: json["city"],
      ); 

  int get id => this.rx.id.value; 
  int get temp => this.rx.temp.value; 
  String get city=> this.rx.city.value;
  String get weatherIcon=> this.rx.weatherIcon.value;
  String get tempMessage=> this.rx.tempMessage.value;

  set id(int id) {
    this.rx.id.value = id;
    String weatherIcon = getWeatherIcon(id);
    this.rx.weatherIcon.value = weatherIcon;
  }

  set temp(int temp) {
    this.rx.temp.value = temp.toInt();
    String tempMessage = getMessage(temp.toInt());
    this.rx.tempMessage.value = tempMessage;
  }

  set city(String city) {
    this.rx.city.value = city;
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
