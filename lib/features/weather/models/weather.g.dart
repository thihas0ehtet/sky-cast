// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
  city: City.fromJson(json['city'] as Map<String, dynamic>),
  list: (json['list'] as List<dynamic>)
      .map((e) => ForecastItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
  'city': instance.city,
  'list': instance.list,
};

City _$CityFromJson(Map<String, dynamic> json) => City(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String,
  timezone: (json['timezone'] as num).toInt(),
  population: (json['population'] as num).toInt(),
  sunrise: (json['sunrise'] as num).toInt(),
  sunset: (json['sunset'] as num).toInt(),
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'country': instance.country,
  'timezone': instance.timezone,
  'population': instance.population,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
);

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
  'lat': instance.lat,
  'lon': instance.lon,
};

ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) => ForecastItem(
  timestamp: (json['dt'] as num).toInt(),
  main: Main.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
      .toList(),
  clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num?)?.toInt(),
  pop: (json['pop'] as num).toDouble(),
  rain: json['rain'] == null
      ? null
      : Rain.fromJson(json['rain'] as Map<String, dynamic>),
  snow: json['snow'] == null
      ? null
      : Snow.fromJson(json['snow'] as Map<String, dynamic>),
  sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
  dateTimeText: json['dt_txt'] as String,
);

Map<String, dynamic> _$ForecastItemToJson(ForecastItem instance) =>
    <String, dynamic>{
      'dt': instance.timestamp,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'rain': instance.rain,
      'snow': instance.snow,
      'sys': instance.sys,
      'dt_txt': instance.dateTimeText,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
  temp: (json['temp'] as num).toDouble(),
  feelsLike: (json['feels_like'] as num).toDouble(),
  tempMin: (json['temp_min'] as num).toDouble(),
  tempMax: (json['temp_max'] as num).toDouble(),
  pressure: (json['pressure'] as num).toDouble(),
  seaLevel: (json['sea_level'] as num?)?.toDouble(),
  grndLevel: (json['grnd_level'] as num?)?.toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  tempKf: (json['temp_kf'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
  'humidity': instance.humidity,
  'temp_kf': instance.tempKf,
};

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    Clouds(all: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
  'all': instance.all,
};

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

Rain _$RainFromJson(Map<String, dynamic> json) =>
    Rain(volume3h: (json['3h'] as num?)?.toDouble());

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{
  '3h': instance.volume3h,
};

Snow _$SnowFromJson(Map<String, dynamic> json) =>
    Snow(volume3h: (json['3h'] as num?)?.toDouble());

Map<String, dynamic> _$SnowToJson(Snow instance) => <String, dynamic>{
  '3h': instance.volume3h,
};

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(pod: json['pod'] as String);

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
  'pod': instance.pod,
};
