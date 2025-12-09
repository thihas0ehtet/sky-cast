import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/app_colors.dart';

class CityList extends StatelessWidget {
  final void Function(String) onSelectCity;

  const CityList({super.key, required this.onSelectCity});

  @override
  Widget build(BuildContext context) {
    final cities = ["Yangon", "Mandalay", "Magway", "Singapore", "London"];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 4),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: cities.map((city) => _buildCityTile(city)).toList(),
      ),
    );
  }

  Widget _buildCityTile(String city) {
    return GestureDetector(
      onTap: () => onSelectCity(city),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: Colors.black12,
            ),
          ],
        ),
        child: Text(
          city,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlue,
          ),
        ),
      ),
    );
  }
}
