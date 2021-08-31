import 'package:cloud_app_getx/controllers/location_controller.dart';
import 'package:cloud_app_getx/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (_) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        await _.rechargeLocationWeather();
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        // var typedName = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return CityScreen();
                        //     },
                        //   ),
                        // );
                        // if (typedName != null) {
                        //   var weatherData =
                        //       await weatherModel.getCityWeather(typedName);
                        //   updateUI(weatherData);
                        // }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${_.weather.temp}°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '${_.weather.weatherIcon}',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "${_.weather.tempMessage} in ${_.weather.city}",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
