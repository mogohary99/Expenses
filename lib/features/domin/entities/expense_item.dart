import 'dart:ui';

import 'package:equatable/equatable.dart';

class ExpenseItemEntity extends Equatable{
  final String title;
  final double price;
  final double percentage;
  final int numOfTransaction;
  final Color color;

  const ExpenseItemEntity(
      {required this.title,
      required this.price,
      required this.percentage,
      required this.numOfTransaction,
      required this.color,});
  @override
  List<Object?> get props => [
    title,
    price,
    percentage,
    numOfTransaction,
    color,
  ];

}