// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    @required this.id,
    @required this.temp,
    @required this.city,
  }) {
    weatherIcon = getWeatherIcon(id!);
    tempMessage = getMessage(temp!);
  }

  final int? id;
  final int? temp;
  final String? city;
  String? weatherIcon;
  String? tempMessage;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        temp: json["temp"].toInt(),
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temp": temp,
        "city": city,
        "weatherIcon": weatherIcon,
        "tempMessage": tempMessage,
      };

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
