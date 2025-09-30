import 'package:careercompass/features/home/presentation/views/widgets/home_header.dart';
import 'package:careercompass/features/home/presentation/views/widgets/see_all_section.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(username: "Mirna"),
          const SizedBox(height: 20),
          SeeAllSection(title: "Jobs for You"),
          const SizedBox(height: 10),

          // Grid of Job Cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 4 / 3, // adjust height/width balance
                children: [
                  Card(
                    title: "Data Analyst",
                    role: "Data Scientist",
                    sector: "Healthcare",
                    salary: 332000,
                    color: mainColor,
                    icon: Icons.analytics,
                  ),
                  Card(
                    title: "Event Manager",
                    role: "Conference Manager",
                    sector: "Energy",
                    salary: 311500,
                    color: mainColor,
                    icon: Icons.event,
                  ),
                  Card(
                    title: "Operations Manager",
                    role: "Quality Control Manager",
                    sector: "Insurance",
                    salary: 301000,
                    color: mainColor,
                    icon: Icons.settings,
                  ),
                  Card(
                    title: "Software Tester",
                    role: "Quality Assurance",
                    sector: "Infrastructure",
                    salary: 304000,
                    color: mainColor,
                    icon: Icons.bug_report,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable job card widget
class Card extends StatelessWidget {
  final String title;
  final String role;
  final String sector;
  final double salary;
  final Color color;
  final IconData icon;

  const Card({
    super.key,
    required this.title,
    required this.role,
    required this.sector,
    required this.salary,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Top half
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Role: $role",
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(icon, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),

          // Bottom half
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Average Salary",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    salary.toStringAsFixed(0),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

