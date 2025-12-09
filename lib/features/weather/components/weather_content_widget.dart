import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/app_colors.dart';
import 'package:sky_cast/core/utils/utils.dart';
import 'package:sky_cast/features/weather/models/weather.dart';
import 'current_weather.dart';
import 'temperature_toggle.dart';
import 'forecast_list.dart';

class WeatherContentWidget extends StatefulWidget {
  final Weather weather;

  const WeatherContentWidget({super.key, required this.weather});

  @override
  State<WeatherContentWidget> createState() => _WeatherContentWidgetState();
}

class _WeatherContentWidgetState extends State<WeatherContentWidget> {
  bool _isCelsius = true;

  @override
  Widget build(BuildContext context) {
    final current = widget.weather.list.first;

    final dailyMap = Utils.getDailyForecast(widget.weather.list);
    final dailyList = dailyMap.values.toList();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              Utils.dateTimeFormat(
                date: DateTime.now().toString(),
                timezoneOffsetInSeconds: widget.weather.city.timezone,
              ),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            CurrentWeather(current: current, isCelsius: _isCelsius),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '5-Day Forecast',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TemperatureToggle(
                    isCelsius: _isCelsius,
                    onChanged: (value) => setState(() => _isCelsius = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ForecastList(forecastList: dailyList, isCelsius: _isCelsius),
          ],
        ),
      ),
    );
  }
}
