import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

import 'package:intl/intl.dart';
import 'package:sky_cast/features/weather/models/weather.dart';

enum PrintType { log, error }

abstract class Utils {
  static String formatTemperature(double temp, {bool isCelsius = true}) {
    if (isCelsius) {
      return temp.toStringAsFixed(0);
    } else {
      return ((temp * 9 / 5) + 32).toStringAsFixed(0);
    }
  }

  static Map<String, ForecastItem> getDailyForecast(
    List<ForecastItem> forecastList,
  ) {
    final Map<String, ForecastItem> dailyMap = {};
    final today = DateTime.now();

    for (var item in forecastList) {
      final dateStr = item.dateTimeText.split(' ')[0];
      final itemDate = DateTime.parse(dateStr);

      // Skip past dates
      if (itemDate.isBefore(today)) continue;

      // Only add if not already added and limit to 5 days
      if (!dailyMap.containsKey(dateStr) && dailyMap.length < 5) {
        dailyMap[dateStr] = item;
      }
    }

    return dailyMap;
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  static String dateTimeFormat({
    required String date,
    String format = "dd MMM yyyy, hh:mm a",
    int? timezoneOffsetInSeconds,
    bool isLocal = false,
  }) {
    DateTime dt;

    if (isLocal) {
      dt = DateTime.parse(date).toLocal();
    } else {
      dt = DateTime.parse(date).toUtc();
    }

    if (timezoneOffsetInSeconds != null) {
      dt = dt.add(Duration(seconds: timezoneOffsetInSeconds));
    }

    return DateFormat(format).format(dt);
  }

  static print(
    dynamic printData, {
    PrintType printType = PrintType.log,
    bool isJsonLog = false,
  }) {
    if (!kDebugMode) return;

    String output;

    if (isJsonLog) {
      try {
        final jsonObject = printData is String
            ? json.decode(printData)
            : printData;
        const encoder = JsonEncoder.withIndent('  ');
        output = encoder.convert(jsonObject);
      } catch (e) {
        output = 'Invalid JSON: $printData';
      }
    } else {
      output = "$printData";
    }

    if (printType == PrintType.error) {
      const ansiRed = '\x1B[31m';
      const ansiReset = '\x1B[0m';
      output = '$ansiRed$output$ansiReset';
    }

    developer.log(output, name: printType.toString());
  }
}
