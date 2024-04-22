import 'package:daleel_store/app/features/home/presentation/view/home_view.dart';
import 'package:daleel_store/app/features/wallet/presentation/view/wallet_view.dart';
import 'package:daleel_store/app/shared/bottom_nav_bar/cubit/navbar_cubit.dart';
import 'package:daleel_store/app/shared/bottom_nav_bar/widgets/dot_bottom_nav_bar.dart';
import 'package:daleel_store/app/shared/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> views = [
    const HomeView(),
    const HomeView(),
    const WalletView(),
    const HomeView(),
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        var cubit = NavbarCubit.get(context);

        return Scaffold(
          key: drawerKey,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: DotBottomNavBar(
            onChange: (index) {
              cubit.changeBottomNavBar(index);
            },
            defaultSelectedIndex: 0,
            showLabel: true,
            textList: const [
              'الرئيسية',
              'التصنيفات',
              'محفظتي',
              'طلباتي',
              'حسابي',
            ],
            iconList: const [
              'assets/icons/home.svg',
              'assets/icons/categories.svg',
              'assets/icons/wallet.svg',
              'assets/icons/list.svg',
              'assets/icons/account.svg',
            ],
          ),
          extendBody: true,
          drawer: const AppDrawer(),
          body: views.elementAt(cubit.currentIndex),
        );
      },
    );
  }
}
