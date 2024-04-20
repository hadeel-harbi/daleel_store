import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class HomeViewBackground extends StatelessWidget {
  const HomeViewBackground({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // festive image
          Image.asset("assets/images/Frame.png",
              width: AppSpaces.screenWidth(context)),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 144,
                ),
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40)),
                  child: Container(
                    width: AppSpaces.screenWidth(context),
                    decoration: BoxDecoration(
                      color: AppColors.light,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.07),
                            blurRadius: 12,
                            spreadRadius: 5,
                            offset: const Offset(0, -2))
                      ],
                    ),
                    child: Stack(
                      children: [
                        // background
                        Image.asset("assets/images/background-blured.png"),
                        Column(
                          children: children,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}