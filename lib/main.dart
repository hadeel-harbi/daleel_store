import 'package:daleel_store/app/core/constants/text_style.dart';
import 'package:daleel_store/app/features/home/presentation/cubit/slider_cubit.dart';
import 'package:daleel_store/app/features/onboarding/presentation/cubit/onboaring_cubit.dart';
import 'package:daleel_store/app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:daleel_store/app/shared/bottom_nav_bar/cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider(
          create: (context) => SliderCubit(),
        ),
        BlocProvider(
          create: (context) => OnboaringCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: const Locale('ar'),
        theme: ThemeData(
          fontFamily: "IBM Plex",
          textTheme: AppTextTheme.textTheme,
        ),
        home: const OnboardingView(),
      ),
    );
  }
}
