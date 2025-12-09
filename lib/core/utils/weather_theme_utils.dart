import 'package:flutter/material.dart';

class WeatherThemeUtils {
  static List<Color> getGradientForCondition(String conditionMain) {
    switch (conditionMain.toLowerCase()) {
      case 'clear':
        return [Colors.blue.shade300, Colors.blue.shade600];
      case 'clouds':
      case 'rain':
      case 'drizzle':
        return [Colors.grey.shade400, Colors.blueGrey.shade700];
      case 'thunderstorm':
        return [Colors.indigo.shade700, Colors.black87];
      case 'snow':
        return [Colors.blueGrey.shade100, Colors.blueGrey.shade300];
      case 'mist':
      case 'fog':
      case 'haze':
        return [Colors.grey.shade400, Colors.grey.shade600];
      default:
        return [Colors.blue.shade200, Colors.blue.shade500];
    }
  }

  static String getBackgroundImageForCondition(String conditionMain) {
    switch (conditionMain.toLowerCase()) {
      case 'clear':
        return 'https://images.stockcake.com/public/b/a/1/ba1e7dda-33b2-4399-b5e1-9ea842fd774c_large/sunny-cloudy-day-stockcake.jpg';
      case 'clouds':
        return 'https://images.unsplash.com/photo-1595661671412-e20c4a3e65cc?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0';
      case 'rain':
        return 'https://img.freepik.com/free-photo/weather-effects-composition_23-2149853295.jpg?semt=ais_hybrid&w=740&q=80';
      case 'thunderstorm':
        return 'https://images.unsplash.com/photo-1492011221367-f47e3ccd77a0?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0';
      case 'snow':
        return 'https://img.freepik.com/free-photo/vertical-shot-forest-with-tall-trees-covered-with-snow_181624-13145.jpg?semt=ais_hybrid&w=740&q=80';
      default:
        return 'https://images.stockcake.com/public/b/a/1/ba1e7dda-33b2-4399-b5e1-9ea842fd774c_large/sunny-cloudy-day-stockcake.jpg';
    }
  }
}
