// ignore_for_file: deprecated_member_use

import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconSvg extends StatelessWidget {
  const IconSvg(this.src,
      {super.key, this.color = AppColors.dark, this.size = 26});

  final String src;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        src,
        color: color,
        height: size,
        width: size,
      ),
    );
  }
}
