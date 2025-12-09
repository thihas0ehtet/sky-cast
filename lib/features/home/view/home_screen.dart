import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_cast/core/config/app_colors.dart';
import 'package:sky_cast/core/config/app_constants.dart';
import 'package:sky_cast/routes/app_router.dart';

import '../components/city_list.dart';
import '../components/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearchPressed() {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    context.push('${AppRouteNames.weather}/$city');
  }

  void _selectCity(String city) {
    _controller.text = city;
    _onSearchPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFB3E5FC), Color(0xFFE1F5FE), Color(0xFFFFFFFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildHeader(),
                const SizedBox(height: 40),
                SearchBox(
                  controller: _controller,
                  onSearchPressed: _onSearchPressed,
                ),
                const SizedBox(height: 40),
                const Text(
                  "Popular Cities",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 16),
                CityList(onSelectCity: _selectCity),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: const [
          Text(
            AppConstants.appName,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: AppColors.darkBlue,
              shadows: [
                Shadow(
                  offset: Offset(1, 2),
                  blurRadius: 3,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Text(
            AppConstants.appDesc,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textColorLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
