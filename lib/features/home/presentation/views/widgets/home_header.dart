import 'package:careercompass/constants.dart';
import 'package:flutter/material.dart';
import 'custom_search_bar.dart';

class HomeHeader extends StatelessWidget {
  final String username;

  const HomeHeader({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: mainColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, $username",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Image.asset(
                      "assets/icons/bell.png",
                      width: 32,
                      height: 32,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Image.asset(
                      "assets/icons/messageUs.png", // your chat image
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),

            ],
          ),

          const SizedBox(height: 10),

          /// Location Row
          Row(
            children: const [
              Icon(Icons.location_on, color: Color(0xffDCD0A8), size: 18),
              SizedBox(width: 4),
              Text(
                "Alex, Egypt",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Icon(Icons.keyboard_arrow_down, color: Color(0xffDCD0A8)),
            ],
          ),

          const SizedBox(height: 16),

          const CustomSearchBar(),
        ],
      ),
    );
  }
}
