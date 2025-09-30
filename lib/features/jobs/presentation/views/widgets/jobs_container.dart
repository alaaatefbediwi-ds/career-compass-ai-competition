import 'package:flutter/material.dart';

class JobsContainer extends StatelessWidget {
  final String title;
  final String role;
  final double salary;
  final Color color;
  final String sector;
  final IconData icon;

  const JobsContainer({
    super.key,
    required this.title,
    required this.role,
    required this.salary,
    required this.color,
    required this.icon,
    required this.sector,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ prevents overflow
        children: [
          // Top part
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Role: $role",
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Sector: $sector",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Icon(icon, color: Colors.white, size: 28),
              ],
            ),
          ),

          // Bottom part
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Average Salary",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  salary.toStringAsFixed(0),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
