import 'package:json_annotation/json_annotation.dart';
import 'package:sky_cast/core/network/base_response.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends BaseResponse {
  final City city;
  final List<ForecastItem> list;

  Weather({required this.city, required this.list});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int timezone;
  final int population;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.timezone,
    required this.population,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Coord {
  final double lat;
  final double lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@JsonSerializable()
class ForecastItem {
  @JsonKey(name: 'dt')
  final int timestamp;

  @JsonKey(name: 'main')
  final Main main;

  @JsonKey(name: 'weather')
  final List<WeatherCondition> weather;

  @JsonKey(name: 'clouds')
  final Clouds clouds;

  @JsonKey(name: 'wind')
  final Wind wind;

  @JsonKey(name: 'visibility')
  final int? visibility;

  @JsonKey(name: 'pop')
  final double pop; // Probability of precipitation

  @JsonKey(name: 'rain')
  final Rain? rain;

  @JsonKey(name: 'snow')
  final Snow? snow;

  @JsonKey(name: 'sys')
  final Sys sys;

  @JsonKey(name: 'dt_txt')
  final String dateTimeText;

  ForecastItem({
    required this.timestamp,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    this.visibility,
    required this.pop,
    this.rain,
    this.snow,
    required this.sys,
    required this.dateTimeText,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);
}

@JsonSerializable()
class Main {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final double pressure;
  @JsonKey(name: 'sea_level')
  final double? seaLevel;
  @JsonKey(name: 'grnd_level')
  final double? grndLevel;
  final int humidity;
  @JsonKey(name: 'temp_kf')
  final double? tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    this.seaLevel,
    this.grndLevel,
    required this.humidity,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);
}

@JsonSerializable()
class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;
  final double? gust;

  Wind({required this.speed, required this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: '3h')
  final double? volume3h;

  Rain({this.volume3h});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@JsonSerializable()
class Snow {
  @JsonKey(name: '3h')
  final double? volume3h;

  Snow({this.volume3h});

  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);
}

@JsonSerializable()
class Sys {
  final String pod; // "d" or "n"

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}
