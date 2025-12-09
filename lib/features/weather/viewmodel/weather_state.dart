import 'package:sky_cast/features/weather/models/weather.dart';

class WeatherState {
  final bool isLoading;
  final String? errorMessage;
  final Weather? weather;

  WeatherState({this.isLoading = false, this.errorMessage, this.weather});

  bool get hasError => errorMessage != null && !isLoading;

  WeatherState copyWith({
    bool? isLoading,
    String? errorMessage,
    Weather? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      weather: weather ?? this.weather,
    );
  }

  factory WeatherState.initial() => WeatherState(isLoading: false);

  factory WeatherState.success(Weather? weather) =>
      WeatherState(isLoading: false, weather: weather);

  factory WeatherState.loading() => WeatherState(isLoading: true);

  factory WeatherState.error(String errorMessage) =>
      WeatherState(isLoading: false, errorMessage: errorMessage);
}
