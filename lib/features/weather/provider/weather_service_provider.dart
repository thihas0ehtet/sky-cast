import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sky_cast/features/weather/models/geo_model.dart';
import 'package:sky_cast/features/weather/models/weather.dart';
import 'package:sky_cast/features/weather/repository/weather_repository.dart';

part 'weather_service_provider.g.dart';

@riverpod
WeatherService weatherService(Ref ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);

  return WeatherService(weatherRepository);
}

class WeatherService {
  final WeatherRepository _weatherRepository;

  WeatherService(this._weatherRepository);

  Future<Weather?> fetchWeather(String cityName) async {
    final List<GeoModel> geoDataList = await _weatherRepository.fetchGeoData(
      cityName,
    );

    if (geoDataList.isEmpty) {
      throw Exception('City not found');
    }

    final lat = geoDataList[0].lat;
    final lon = geoDataList[0].lon;

    final Weather? weatherResponse = await _weatherRepository.fetchWeather(
      lat,
      lon,
    );

    if (weatherResponse != null && weatherResponse.list.isEmpty) {
      throw Exception('Weather Data not found');
    }

    return weatherResponse;
  }
}
