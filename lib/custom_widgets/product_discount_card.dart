import 'package:flutter/material.dart';

class ProductDiscountCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String discountMessage;

  const ProductDiscountCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.discountMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: NetworkImage(imageUrl),
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Color(0xff1F2937),
            ),
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            width: 78,
            height: 19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color(0xffEF4444),
            ),
            child: Text(
              discountMessage,
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
