import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.logo,
    required this.color,
    this.imageColor,
    required this.padding,
  });
  final String logo;
  final Color color;
  final Color? imageColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      width: 85,
      height: 128,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Image.asset(
        logo,
        color: imageColor,
      ),
    );
  }
}
