import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearchPressed;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black87),
              cursorColor: Colors.black87,
              decoration: InputDecoration(
                hintText: "Search city...",
                hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
                border: InputBorder.none,
                fillColor: Colors.transparent,
                filled: true,
              ),
              onSubmitted: (_) => onSearchPressed(),
            ),
          ),
          GestureDetector(
            onTap: onSearchPressed,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
