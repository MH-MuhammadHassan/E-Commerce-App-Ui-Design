import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color bgColor;

  const CategoryItem({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 32, // Adjust size as needed
          backgroundColor: bgColor, // Background color
          child: SvgPicture.asset(
            iconPath,
            width: 30, // Adjust icon size
            height: 30,
          ),
        ),
        const SizedBox(height: 4), // Space between icon and text
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff1F2937),
          ),
        ),
      ],
    );
  }
}
