
class WeatherCurrent{
  final Current current;

  WeatherCurrent({required this.current});

  factory WeatherCurrent.fromJson(Map<String, dynamic>json) => 
    WeatherCurrent(current: Current.fromJson(json['current']));
  
}


class Current {
	
	int? temp;
	
	int? humidity;
  double? feelsLike;
	int? clouds;
  double? uvIndex;
	double? windSpeed;
	List<Weather>? weather;

	Current({
	
		this.temp, 
		
		this.humidity, 

    this.feelsLike,

		this.clouds, 

    this.uvIndex,
		
		this.windSpeed, 
	 
		this.weather, 
	
	});

	factory Current.fromJson(Map<String, dynamic> json) => Current(
				
				temp: (json['temp'] as num?)?.round(),
				feelsLike: (json['feels_like'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
				uvIndex:  (json['uvi'] as num?)?.toDouble(),
				clouds: json['clouds'] as int?,
				windSpeed: (json['wind_speed'] as num?)?.toDouble(),
				weather: (json['weather'] as List<dynamic>?)
						?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
						.toList(),
				
			);

	Map<String, dynamic> toJson() => {
				
				'temp': temp,

        'feels_like': feelsLike,

        'uvi':uvIndex,
				
				'humidity': humidity,
				
				'clouds': clouds,
				
				'wind_speed': windSpeed,
				
				'weather': weather?.map((e) => e.toJson()).toList(),
			
			};
}



class Weather {
	int? id;
  String? main;
  String? description;
  String? icon;
	

	Weather({
    this.id,
    this.main,
    this.description,
    this.icon
		
	});

	factory Weather.fromJson(Map<String, dynamic> json) => Weather(
				id: (json['id'] as int?),
				main: (json['main'] as String?),
        description: (json['description'] as String?),
        icon: (json['icon'] as String?),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
        'main':main,
        'description' : description,
        'icon':icon
			};
}
