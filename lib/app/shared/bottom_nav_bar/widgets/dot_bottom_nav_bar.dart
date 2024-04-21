import 'package:daleel_store/app/core/constants/colors.dart';
import 'package:daleel_store/app/core/utils/svg_icon.dart';
import 'package:flutter/material.dart';

class DotBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;
  final List<String> textList;

  final Color selectedColor;
  final Color unselectedColor;

  final double sizeIcon;
  final bool showLabel;

  const DotBottomNavBar({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconList,
    required this.textList,
    this.selectedColor = AppColors.primary,
    this.unselectedColor = AppColors.dark,
    this.sizeIcon = 26,
    this.showLabel = true,
  });

  @override
  State<DotBottomNavBar> createState() => _DotBottomNavBarState();
}

class _DotBottomNavBarState extends State<DotBottomNavBar> {
  int _selectedIndex = 0;
  List<String> _iconList = [];
  List<String> _textList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _textList = widget.textList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i, _textList[i]));
    }

    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.ternaryGrey.withOpacity(0.98),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Row(
        children: navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(String icon, int index, String text) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _selectedIndex == index ? selectedDot() : unselectedDot(),
            Container(
                width: MediaQuery.of(context).size.width / _iconList.length,
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: IconSvg(
                  icon,
                  size: widget.sizeIcon,
                  color: _selectedIndex == index
                      ? widget.selectedColor
                      : widget.unselectedColor.withOpacity(0.5),
                )),
            Visibility(
              visible: widget.showLabel,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _selectedIndex == index
                          ? widget.selectedColor
                          : widget.unselectedColor.withOpacity(0.5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedDot() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: widget.selectedColor, borderRadius: BorderRadius.circular(2)),
    );
  }

  Widget unselectedDot() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(2)),
    );
  }
}
