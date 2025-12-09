import 'package:flutter/material.dart';
import 'package:sky_cast/features/weather/models/weather.dart';
import 'forecast_item_widget.dart';

class ForecastList extends StatelessWidget {
  final List<ForecastItem> forecastList;
  final bool isCelsius;

  const ForecastList({
    super.key,
    required this.forecastList,
    required this.isCelsius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: forecastList
          .map((item) => ForecastItemWidget(item: item, isCelsius: isCelsius))
          .toList(),
    );
  }
}
