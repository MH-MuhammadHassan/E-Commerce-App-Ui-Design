import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double cutoffPrice;
  final String discount;
  final double rating;
  final int orderCount;
  final bool isTopSeller;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.cutoffPrice,
    required this.discount,
    required this.rating,
    required this.orderCount,
    this.isTopSeller = false,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.37),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: 148,
                  height: 104,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
              ),
              if (isTopSeller)
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xffEA580C),
                    ),
                    width: 56,
                    height: 19,
                    child: Text(
                      "Top Seller",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              Positioned(
                top: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 17,
                    color: isFavorite ? Color(0xffEF4444) : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          // Product Title with line wrapping
          SizedBox(
            height: 8,
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff1F2937),
              ),
              maxLines: 2, // Limit to two lines
              overflow: TextOverflow.ellipsis, // Show "..." if text is too long
              softWrap: true, // Allows wrapping text
            ),
          ),
          SizedBox(
            height: 8,
          ),
          // Price, Cutoff price, and Discount
          Row(
            spacing: 4,
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff1F2937),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$$cutoffPrice",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 10,
                  color: Color(0xff9CA3AF),
                ),
              ),
              Text(
                "$discount OFF",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Color(0xffEA580C),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          // Rating and Order Count
          Row(
            children: [
              // Rating icon
              Container(
                width: 15,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Icon(
                    Icons.star_border, // White outlined star
                    color: Colors.white,
                    size: 12, // Adjust size to fit within 15x16
                  ),
                ),
              ),
              SizedBox(width: 4),
              Text(
                "$rating",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff1F2937),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Text(
                "($orderCount)",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff6B7280),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
