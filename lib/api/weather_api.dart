import 'dart:convert';

import 'package:cloud_app_getx/models/weather.dart';
import 'package:dio/dio.dart'; 

const apiKey = 'ed3bae6b7aaed51670cf31de3a802f90';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherApi{
  WeatherApi._internal(); 
  static WeatherApi _instance = WeatherApi._internal(); 
  static WeatherApi get instance => _instance;  

  final _dio = Dio(); 

  Future<Weather?> getLocationWeather(double latitude, double longitude) async{
    try{
      final response = await this._dio.get( 
        "$openWeatherMapURL?lat=${latitude}&lon=${longitude}&appid=$apiKey&units=metric"
      );

      Map<String,dynamic> json = {}; 
      json["id"]=response.data['weather'][0]['id']; 
      json["temp"]= response.data['main']['temp']; 
      json["city"]=response.data['name']; 
      return Weather.fromJson(json);
    }catch(e){
      print(e); 
      return null;
    }
  } 

  Future<Weather?> getCityWeather(String cityName) async {
    try{
      final response = await this._dio.get( 
        "$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric"
      );

      Map<String,dynamic> json = {}; 
      json["id"]=response.data['weather'][0]['id']; 
      json["temp"]= response.data['main']['temp']; 
      json["city"]=response.data['name']; 
      return Weather.fromJson(json);
    }catch(e){
      print(e); 
      return null;
    }
  }
}