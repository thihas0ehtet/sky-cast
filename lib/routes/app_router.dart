import 'package:go_router/go_router.dart';
import 'package:sky_cast/features/home/view/home_screen.dart';
import 'package:sky_cast/features/weather/view/weather_screen.dart';

class AppRouteNames {
  static const String home = '/';
  static const String weather = '/weather';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteNames.home,
  routes: [
    GoRoute(
      path: AppRouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '${AppRouteNames.weather}/:city',
      builder: (context, state) {
        final city = state.pathParameters['city']!;
        return WeatherScreen(city: city);
      },
    ),
  ],
);
