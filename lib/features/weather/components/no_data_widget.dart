import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/app_colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.backgroundGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off,
                size: 60,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(height: 20),
              const Text(
                'No weather data available',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColorDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}