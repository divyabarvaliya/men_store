import 'package:flutter/material.dart';

class AppColors {
  static const blue = Color(0xFF314FF6);
  static const bg = Color(0xff2B2B2B);
  static const lightOrange = Color(0xffFDAB72);
  static const orange = Color(0xffFE954D);

  static const MaterialColor greyScale = MaterialColor(0xFFEAE9E8, <int, Color>{
    10: Color(0xFFC4C4C4),
    20: Color(0xff8E8E8E),
  });
  static Gradient linearGradient = LinearGradient(
    colors: [lightOrange, orange], // Start → End colors
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
