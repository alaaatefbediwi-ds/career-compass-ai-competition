import 'package:flutter/material.dart';

import '../../../../../constants.dart';

// lib/widgets/job_card.dart
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String companyInitials;
  final String title;
  final String location;
  final String salary;
  final String timeAgo;

  const JobCard({
    super.key,
    required this.companyInitials,
    required this.title,
    required this.location,
    required this.salary,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: lightGrey,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Column 1: Custom Avatar Box
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              companyInitials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// Column 2: Job Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Color(0xffDCD0A8), size: 18),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  salary,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildChipButton("Remote"),
                    const SizedBox(width: 8),
                    _buildChipButton("Onsite"),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// Column 3: Bookmark + Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.bookmark_border, color: mainColor),
              const SizedBox(height: 30),
              Text(
                timeAgo,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChipButton(String text) {
    return SizedBox(
      width: 85,
      height: 32,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: lightGrey,
          foregroundColor: Colors.black,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
