import 'package:daleel_store/app/core/utils/exports.dart';

class RotateImage extends StatelessWidget {
  const RotateImage(
      {super.key,
      required this.image,
      required this.pageOffset,
      this.isNegative = false});

  final String image;
  final double pageOffset;
  final bool isNegative;

  @override
  Widget build(BuildContext context) {
    double value = pageOffset;

    return Transform.rotate(
      angle: isNegative ? -value * 2.9 : value * 2.9,
      child: Image.asset(
        image,
      ),
    );
  }
}
