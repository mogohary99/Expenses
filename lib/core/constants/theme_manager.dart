import 'package:expenses/core/constants/colors_manager.dart';
import 'package:expenses/core/constants/font_manager.dart';
import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
      fontFamily: FontConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
    );

TextTheme get _textTheme =>  TextTheme(
  headlineLarge: TextStyle(
    color: AppColors.blackGrey.withOpacity(0.8),
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.s36,
  ),
      headlineMedium: const TextStyle(
        color: AppColors.black,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSize.s22,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackLight,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSize.s18,
      ),
      bodySmall: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSize.s16,
      ),
    );
