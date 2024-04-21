import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LightDarkSwitch extends StatefulWidget {
  const LightDarkSwitch({
    super.key,
  });

  @override
  State<LightDarkSwitch> createState() => _LightDarkSwitchState();
}

class _LightDarkSwitchState extends State<LightDarkSwitch> {
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          setState(() {
            isDark = !isDark;
          });
        },
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        radius: 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 45,
          height: 25,
          padding: const EdgeInsets.all(3),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: isDark
                  ? AppColors.primary
                  : const Color.fromARGB(255, 216, 215, 226)),
          child: isDark
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 19,
                    width: 19,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.light,
                    ),
                    child: const IconSvg(
                      "assets/icons/night.svg",
                    ),
                  )
                      .animate()
                      .fadeIn()
                      .rotate(duration: const Duration(milliseconds: 600))
                      .slideX(begin: -1.2),
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 19,
                    width: 19,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.light,
                    ),
                    child: const IconSvg(
                      "assets/icons/sun.svg",
                    ),
                  )
                      .animate()
                      .fadeIn()
                      .rotate(
                          begin: 0.2,
                          end: -0.2,
                          delay: const Duration(milliseconds: 50),
                          duration: const Duration(milliseconds: 300))
                      .slideX(begin: 1),
                ),
        ),
      ),
    );
  }
}