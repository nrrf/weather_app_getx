import 'package:cloud_app_getx/controllers/weather_controller.dart';
import 'package:get/route_manager.dart';
import 'package:cloud_app_getx/models/weather.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  Weather? _weather; 
  Weather get weather => _weather!; 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    this._weather = Get.arguments as Weather; 
  } 

  Future<void> rechargeLocationWeather() async {
    final weatherController = Get.find<WeatherController>(); 
    Weather? weather = await weatherController.loadLocationWeather();  
    // Use of setters
    _weather!.id = weather!.id; 
    _weather!.temp= weather.temp; 
    _weather!.city = weather.city;
  }
}