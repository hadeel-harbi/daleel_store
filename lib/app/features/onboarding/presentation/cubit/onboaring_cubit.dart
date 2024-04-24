import 'package:daleel_store/app/core/utils/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboaring_state.dart';

class OnboaringCubit extends Cubit<OnboaringState> {
  OnboaringCubit() : super(OnboaringInitial());
  static OnboaringCubit get(context) => BlocProvider.of(context);

  final pageController = PageController();
  int currentIndex = 0;

  double get currentOffset {
    bool initiated = pageController.hasClients &&
        pageController.position.hasContentDimensions;
    return initiated ? pageController.page! : pageController.initialPage * 1.0;
  }

  void changeIndex(int index) {
    currentIndex = index;

    emit(UpdateIndexState());
  }

  void nextPage(BuildContext context) {
    if (currentIndex == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }
}
