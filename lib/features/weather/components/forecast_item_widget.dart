import 'package:flutter/material.dart';
import 'package:sky_cast/components/custom_image.dart';
import 'package:sky_cast/core/config/app_colors.dart';
import 'package:sky_cast/core/config/app_constants.dart';
import 'package:sky_cast/core/utils/utils.dart';
import 'package:sky_cast/features/weather/models/weather.dart';

class ForecastItemWidget extends StatelessWidget {
  final ForecastItem item;
  final bool isCelsius;

  const ForecastItemWidget({
    super.key,
    required this.item,
    required this.isCelsius,
  });

  @override
  Widget build(BuildContext context) {
    final date = item.dateTimeText.split(' ')[0];
    final dayCondition = item.weather.isNotEmpty
        ? item.weather.first
        : WeatherCondition(id: 0, main: 'N/A', description: 'N/A', icon: '');

    final minTemp = Utils.formatTemperature(
      item.main.tempMin,
      isCelsius: isCelsius,
    );
    final maxTemp = Utils.formatTemperature(
      item.main.tempMax,
      isCelsius: isCelsius,
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomImage(
            imageUrl: "${AppConstants.imageBaseUrl}/${dayCondition.icon}.png",
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.dateTimeFormat(date: date, format: "E, dd MMM"),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  Utils.capitalize(dayCondition.description),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textColorMedium,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$minTemp° / $maxTemp°${isCelsius ? 'C' : 'F'}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
