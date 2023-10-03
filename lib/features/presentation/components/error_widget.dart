import 'package:expenses/core/constants/assets_manager.dart';
import 'package:expenses/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../controllers/expenses_cubit/expenses_cubit.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: const Color(0xff9776CD),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppImages.error2,
            ),
          40.0.h(context),
            ElevatedButton.icon(
              onPressed: () =>  ExpensesCubit.get(context).getExpensesData,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7ECBCC)),
              icon: SvgPicture.asset(
                AppIcons.reloadIcon,
                color: Colors.white,
              ),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
