import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_flutter/model/weather_daily.dart';
import 'package:weatherapp_flutter/utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDaily weatherDaily;
  const DailyWeatherWidget({super.key, required this.weatherDaily});

  String getDay(final day){
    DateTime time = DateTime.fromMicrosecondsSinceEpoch(day * 1000);
    final x  = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text("This Week",
            style: TextStyle(color: CustomColors.textColorBlack,fontSize:17 ),),
          ),
          dailyList()
        ],
      ),
    );
  }

  Widget dailyList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDaily.daily.length > 7 ? 7 : weatherDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [Container(height: 60,
            padding: const EdgeInsets.only(left: 10,right: 10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(getDay(weatherDaily.daily[index].dt,)
                    ,style: const TextStyle(color: CustomColors.textColorBlack, fontSize: 13),),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/weather/${weatherDaily.daily[index].weather![0].icon}.png"),
                  ),
                  Text(
                    "${weatherDaily.daily[index].temp!.max}°/${weatherDaily.daily[index].temp!.min}°"
                  )
                ],
              )              
            ),
            Container(
              height: 1,
              color: CustomColors.dividerLine,
            )
            
            ],
          );
        },
        ),
       
    );
  }
}