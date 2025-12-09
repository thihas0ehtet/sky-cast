import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/components/custom_image.dart';
import 'package:sky_cast/core/config/app_colors.dart';
import 'package:sky_cast/components/loading_widget.dart';
import 'package:sky_cast/core/utils/weather_theme_utils.dart';
import 'package:sky_cast/features/weather/components/no_data_widget.dart';
import 'package:sky_cast/features/weather/components/weather_content_widget.dart';
import 'package:sky_cast/features/weather/components/weather_error_widget.dart';
import 'package:sky_cast/features/weather/models/weather.dart';
import 'package:sky_cast/features/weather/viewmodel/weather_viewmodel.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  final String city;

  const WeatherScreen({super.key, required this.city});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(weatherViewModelProvider.notifier).fetchWeather(widget.city);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weatherViewModelProvider);

    if (state.isLoading) {
      return LoadingWidget();
    }

    if (state.hasError) {
      return WeatherErrorWidget(
        errorMessage: state.errorMessage!,
        onRetry: () => ref
            .read(weatherViewModelProvider.notifier)
            .fetchWeather(widget.city),
      );
    }

    if (state.weather == null) {
      return NoDataWidget();
    }

    return _buildWeatherScreen(state.weather!);
  }

  Widget _buildWeatherScreen(Weather weather) {
    final currentCondition = weather.list.first.weather.first.main;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: WeatherThemeUtils.getGradientForCondition(currentCondition),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "${weather.city.name}, ${weather.city.country}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: CustomImage(
                  imageUrl: WeatherThemeUtils.getBackgroundImageForCondition(
                    currentCondition,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: WeatherContentWidget(weather: weather),
            ),
          ],
        ),
      ),
    );
  }
}
