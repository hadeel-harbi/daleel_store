import 'package:daleel_store/app/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(NavbarInitial());

  static SliderCubit get(context) => BlocProvider.of(context);

  final controller = PageController(viewportFraction: 1, keepPage: true);
  final pages = List.generate(
    6,
    (index) => Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        AppImages.giftCard,
        fit: BoxFit.cover,
      ),
    ),
  );

  void onDotClicked(int index) {
    emit(UpdatedState());
  }
}
