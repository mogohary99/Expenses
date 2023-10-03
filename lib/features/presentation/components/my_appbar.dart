import 'package:expenses/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
  return AppBar(
    title: Text(
      'Expenses',
      style: context.headlineMedium,
    ),
    leading: const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
  );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}