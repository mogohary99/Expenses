import 'package:expenses/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

List<String> splashImages= [
  AppImages.splash,
  AppImages.splash2,
  AppImages.splash3,
];

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff9776CD),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'PLEASE WAIT ...',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(
              (splashImages..shuffle()).first,
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                'We are currently checking our records...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
