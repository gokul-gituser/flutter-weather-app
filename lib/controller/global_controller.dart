import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_flutter/api/fetch_weather.dart';
import 'package:weatherapp_flutter/model/weather_data.dart';

class GlobalController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude =0.0.obs;
  final RxInt _currentIndex =0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if(_isLoading.isTrue){
      getLocation(); 
    }else{
      getIndex();
    }
    
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await  Geolocator.isLocationServiceEnabled();
    if(!isServiceEnabled){
      return Future.error("Location Not Enabled");
    }

     locationPermission= await Geolocator.checkPermission();

     if(locationPermission == LocationPermission.deniedForever){
      return Future.error("Location permission denied forever");
     } else if (locationPermission ==LocationPermission.denied){
      locationPermission= await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("Location Permission Denied");
      }
     }

     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((value) {
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;

        return FetchWeather()
              .processData(value.latitude, value.longitude)
              .then((value) {
                weatherData.value = value;

                _isLoading.value = false;
              });
      });
  }

  RxInt getIndex(){
    return _currentIndex;
  }
}

