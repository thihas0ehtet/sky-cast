import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/app_colors.dart';

class TemperatureToggle extends StatelessWidget {
  final bool isCelsius;
  final Function(bool) onChanged;

  const TemperatureToggle({
    super.key,
    required this.isCelsius,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: isCelsius ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width / 4 - 16,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(true),
                  child: Center(
                    child: Text(
                      "°C",
                      style: TextStyle(
                        color: isCelsius ? Colors.white : AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(false),
                  child: Center(
                    child: Text(
                      "°F",
                      style: TextStyle(
                        color: !isCelsius
                            ? Colors.white
                            : AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
