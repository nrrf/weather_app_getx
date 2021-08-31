import 'package:cloud_app_getx/api/weather_api.dart';
import 'package:cloud_app_getx/models/location.dart';
import 'package:cloud_app_getx/models/weather.dart';
import 'package:get/state_manager.dart'; 


class WeatherController extends GetxController{
  Weather? _weather;  
  Weather? get weather => _weather;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();  
  } 

 Future<Weather?> loadLocationWeather() async {
   Location location = Location();
   await location.getCurrentLocation();

   return _weather = await WeatherApi.instance.getLocationWeather(location.latitude,location.longitude);
  } 
}