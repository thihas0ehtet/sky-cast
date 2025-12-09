import 'package:flutter/material.dart';
import 'package:sky_cast/components/custom_image.dart';
import 'package:sky_cast/core/config/app_colors.dart';
import 'package:sky_cast/core/config/app_constants.dart';
import 'package:sky_cast/core/utils/utils.dart';
import 'package:sky_cast/features/weather/models/weather.dart';

class CurrentWeather extends StatelessWidget {
  final ForecastItem current;
  final bool isCelsius;

  const CurrentWeather({
    super.key,
    required this.current,
    required this.isCelsius,
  });

  @override
  Widget build(BuildContext context) {
    final condition = current.weather.first;
    final currentTemp = Utils.formatTemperature(
      current.main.temp,
      isCelsius: isCelsius,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          child: CustomImage(
            imageUrl: '${AppConstants.imageBaseUrl}/${condition.icon}@2x.png',
            width: 120,
            height: 80,
          ),
        ),

        const SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$currentTemp°${isCelsius ? 'C' : 'F'}',
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorDark,
              ),
            ),
            const SizedBox(height: 5),

            Text(
              Utils.capitalize(condition.description),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
