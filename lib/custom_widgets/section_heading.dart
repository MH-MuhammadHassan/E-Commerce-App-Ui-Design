import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionHeading({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xff1F2937),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  "View All",
                  style: TextStyle(fontSize: 12, color: Color(0xff6B7280)),
                ),
                SizedBox(width: 4), // Space between text and icon
                Icon(
                  Icons.arrow_forward_ios, // Small forward arrow
                  size: 12,
                  color: Color(0xff6B7280),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
