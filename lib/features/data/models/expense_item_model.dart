import 'package:expenses/features/domin/entities/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseItemModel extends ExpenseItemEntity {
  const ExpenseItemModel({
    required super.title,
    required super.price,
    required super.percentage,
    required super.numOfTransaction,
    required super.color,
  });

  factory ExpenseItemModel.fromJson(Map<String, dynamic> json) =>
      ExpenseItemModel(
        title: json['title'] ?? '',
        price: json['value'] ?? 0.0,
        percentage: json['percentage'] ?? 0.0,
        numOfTransaction: json['numOfTransaction'] ?? 0,
        color: json['color'] != null ? Color(int.parse(json['color'])) : Colors.red,
      );
}
