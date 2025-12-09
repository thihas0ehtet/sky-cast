import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sky_cast/features/weather/provider/weather_service_provider.dart';
import 'package:sky_cast/features/weather/viewmodel/weather_state.dart';

part 'weather_viewmodel.g.dart';

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  late final WeatherService _weatherService;

  @override
  WeatherState build() {
    _weatherService = ref.read(weatherServiceProvider);
    return WeatherState.initial();
  }

  Future<void> fetchWeather(String city) async {
    state = WeatherState.loading();

    try {
      final weather = await _weatherService.fetchWeather(city);
      state = WeatherState.success(weather);
    } catch (e) {
      state = WeatherState.error(e.toString());
    }
  }
}
