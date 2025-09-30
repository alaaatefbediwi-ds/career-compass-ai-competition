import 'package:flutter/material.dart';

class SeeAllSection extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback? onActionTap;

  const SeeAllSection({
    Key? key,
    required this.title,
    this.action = "See all",
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              action,
              style: TextStyle(color: Colors.black),            ),
          ),
        ],
      ),
    );
  }
}
