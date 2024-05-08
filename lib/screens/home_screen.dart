import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_flutter/controller/global_controller.dart';
import 'package:weatherapp_flutter/utils/custom_colors.dart';
import 'package:weatherapp_flutter/widgets/comfort_level_widget.dart';
import 'package:weatherapp_flutter/widgets/daily_weather_widget.dart';
import 'package:weatherapp_flutter/widgets/hourly_weather_widget.dart';
import 'package:weatherapp_flutter/widgets/current_weather_widget.dart';
import 'package:weatherapp_flutter/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalController globalController = 
                      Get.put(GlobalController(),permanent:true );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue ? Center(

          child :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/clouds.png",
              height: 200,
              width: 200,),
                const CircularProgressIndicator(),
            ],
          )
        ) : Center(
          child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                 const SizedBox(height: 20,),
                 const HeaderWidget(),
                 CurrentWeatherWidget(
                  weatherCurrent: globalController.getData().getCurrentWeather(),
                 ),
                  const SizedBox(height: 20,),
                HourlyWeatherWidget(weatherHourly: globalController.getData().getHourlyWeather()),

                DailyWeatherWidget(weatherDaily: globalController.getData().getDailyWeather()),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,

                ),
                const SizedBox(
                  height: 10,
                ),
                ComfortLevel(weatherCurrent: globalController.getData().getCurrentWeather())
              ]
          ),
        )
      )
    ));
  }
}