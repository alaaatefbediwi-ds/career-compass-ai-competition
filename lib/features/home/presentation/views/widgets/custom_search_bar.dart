import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final bool showSettings;

  const CustomSearchBar({
    super.key,
    this.showSettings = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08), // subtle shadow
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search jobs, company..",
                border: InputBorder.none,
                icon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
              ),
            ),
          ),
        ),

        if (showSettings) ...[
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.tune, color: Color(0xffDCD0A8)),
          ),
        ],
      ],
    );
  }
}
