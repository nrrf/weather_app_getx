import 'package:cloud_app_getx/controllers/weather_controller.dart';
import 'package:cloud_app_getx/models/weather.dart';
import 'package:cloud_app_getx/screens/location_screen.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    final weatherController = Get.find<WeatherController>(); 
    Weather? weather = await weatherController.loadLocationWeather();  
    print("hola");
    Get.off(()=>LocationScreen(), arguments: weather);
    super.onInit();  
  }
}
