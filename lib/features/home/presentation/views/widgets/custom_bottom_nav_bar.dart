import 'package:careercompass/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<String> icons = const [
    'assets/icons/home.png',
    'assets/icons/job.png',
    'assets/icons/compass.png',
    'assets/icons/ideas.png',
    'assets/icons/user.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isActive = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                icons[index],
                width: isActive ? 32 : 28,
                color: isActive ? mainColor : Colors.grey.withOpacity(0.5),
              ),
            ),
          );
        }),
      ),
    );
  }
}
