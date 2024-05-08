import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_flutter/controller/global_controller.dart';
import 'package:weatherapp_flutter/model/weather_hourly.dart';
import 'package:weatherapp_flutter/utils/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherHourly weatherHourly;
   HourlyWeatherWidget({super.key, required this.weatherHourly});

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5,  horizontal: 20),
          alignment: Alignment.topCenter ,
          child:const Text("Today", style: TextStyle(fontSize: 10),) ,

        ),
        hourlyList(),

      ],
    );
  }

  Widget hourlyList(){
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection:Axis.horizontal ,
        itemCount: weatherHourly.hourly.length > 12 ? 14: weatherHourly.hourly.length,
        itemBuilder: (context, index){
          return Obx((() =>GestureDetector(
            onTap: (){
              cardIndex.value = index;
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(left: 20, right: 5),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(offset: const Offset(0.5,0), 
                blurRadius: 30,
                spreadRadius:1,
                color:CustomColors.dividerLine.withAlpha(150))
              ],
            gradient:cardIndex.value == index?  const LinearGradient(

              colors: [CustomColors.firstGradientColor,CustomColors.secondGradientColor] ):null
              ),
              child: HourlyDetails(
                index: index,
                cardIndex: cardIndex.toInt(),
                temp: weatherHourly.hourly[index].temp!,
                timeStamp:weatherHourly.hourly[index].dt!,
                weatherIcon: weatherHourly.hourly[index].weather![0].icon! ,

              )
          ))
          ));
         
        }
        ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  int index;
   int cardIndex;
  String weatherIcon;

 
  
  HourlyDetails({super.key,
  required this.cardIndex,
   required this.index, 
   required this.timeStamp,
  required this.temp, 
  
  required this.weatherIcon, });

 String getTime(final timeStamp){
    DateTime time = DateTime.fromMicrosecondsSinceEpoch(timeStamp * 1000);
    String x =DateFormat('jm').format(time);
    return x;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
          style: TextStyle(color: cardIndex ==index ? Colors.white : CustomColors.textColorBlack),),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child:Image.asset("assets/weather/$weatherIcon.png",
          height: 40, width: 40,) ,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10) ,
          child: Text("$temp°",style: TextStyle(color: cardIndex ==index ? Colors.white : CustomColors.textColorBlack),),
        )
      ],
    );
  }
}