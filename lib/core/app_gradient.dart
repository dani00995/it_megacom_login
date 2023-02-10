import 'package:flutter/material.dart';
import 'package:test_design_chips/core/app_colors.dart';

abstract class AppGradient{
  static const LinearGradient bgGradient = LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: [AppColors.rose, AppColors.whiteBlue]);
  static const LinearGradient elseBgGradient = LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter, colors: [AppColors.rose, AppColors.whiteBlue]);
  static  LinearGradient whiteBgGradient = LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter, colors: [AppColors.white.withOpacity(0.15), AppColors.white.withOpacity(0.15)]);
}