import 'package:flutter/material.dart';

class AppSpaces {
  static const height4 = SizedBox(height: 4);
  static const height8 = SizedBox(height: 8);
  static const height16 = SizedBox(height: 16);
  static const height24 = SizedBox(height: 24);
  static const height32 = SizedBox(height: 32);
  static const height48 = SizedBox(height: 48);
  static const height56 = SizedBox(height: 56);
  static const height64 = SizedBox(height: 64);
  static const height96 = SizedBox(height: 96);
  static const height112 = SizedBox(height: 112);

  static const width4 = SizedBox(width: 4);
  static const width8 = SizedBox(width: 8);
  static const width16 = SizedBox(width: 16);
  static const width24 = SizedBox(width: 24);
  static const width32 = SizedBox(width: 32);
  static const width48 = SizedBox(width: 48);
  static const width56 = SizedBox(width: 56);

  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
