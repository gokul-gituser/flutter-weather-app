import 'package:flutter/material.dart';
import 'package:weatherapp_flutter/model/weather_current.dart';
import 'package:weatherapp_flutter/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherCurrent weatherCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        temperatureAreaWidget(),
        const SizedBox(height: 20),
        currentWeatherMoreDetails()
      ]
    );
  }

  Widget temperatureAreaWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Image.asset(
          "assets/weather/${weatherCurrent.current.weather![0].icon}.png",
          height: 80,
          width:80

        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.amber,
        ),
        RichText(text: TextSpan(
          children: [
            TextSpan(
              text: "${weatherCurrent.current.temp!.toInt()}°C",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColors.textColorBlack
              )
              ),
              TextSpan(
              text: "${weatherCurrent.current.weather![0].description}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: CustomColors.textColorBlack
              )
              )
          ]
            )
    )
    ]
          
        );
      
    
  }

  Widget currentWeatherMoreDetails(){
    return Column(
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Container(
              height:60,
              width:60,
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              )
              ,child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height:60,
              width:60,
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              )
              ,child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height:60,
              width:60,
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              )
              ,child: Image.asset("assets/icons/humidity.png"),
            ),
            
          ]
        ),
        const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text("${weatherCurrent.current.windSpeed}m/s",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),

          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text("${weatherCurrent.current.clouds}%",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),

          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text("${weatherCurrent.current.humidity}%",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            ),

          )
         ],)
      ]
    );
  }

  

}