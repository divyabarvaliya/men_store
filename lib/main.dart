import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:men_store/core/controller/main_controller.dart';
import 'package:men_store/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBidding(),
      debugShowCheckedModeBanner: false,
      title: 'Men Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class AppBidding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}
