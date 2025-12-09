import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'WEATHER_API_URL')
  static const String weatherApiUrl = _Env.weatherApiUrl;

  @EnviedField(varName: 'WEATHER_API_KEY')
  static const String weatherApiKey = _Env.weatherApiKey;
  
  static const String weatherDataApiUrl = '$weatherApiUrl/data/2.5';
  static const String weatherGeoApiUrl = '$weatherApiUrl/geo/1.0';
}