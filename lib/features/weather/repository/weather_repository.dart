import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sky_cast/core/network/api_route.dart';
import 'package:sky_cast/core/network/api_service.dart';
import 'package:sky_cast/core/network/provider/api_service_provider.dart';
import 'package:sky_cast/env/env.dart';
import 'package:sky_cast/features/weather/models/geo_model.dart';
import 'package:sky_cast/features/weather/models/weather.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return WeatherRepository(apiService);
}

class WeatherRepository {
  final ApiService _apiService;

  WeatherRepository(this._apiService);

  Future<List<GeoModel>> fetchGeoData(String cityName) async {
    try {
      final List<GeoModel> geoResponse = await _apiService.getList(
        ApiRoute.geoUrl,
        queryParameters: {'q': cityName, 'appid': Env.weatherApiKey},
        fromJson: GeoModel.fromJson,
      );

      return geoResponse;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  Future<Weather?> fetchWeather(double lat, double lon) async {
    try {
      final weatherResponse = await _apiService.get(
        ApiRoute.weatherDataUrl,
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': Env.weatherApiKey,
        },
        fromJson: Weather.fromJson,
      );

      return weatherResponse;
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
