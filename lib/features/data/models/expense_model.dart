import 'package:expenses/features/data/models/expense_item_model.dart';
import 'package:expenses/features/domin/entities/expense.dart';

class ExpenseModel extends ExpenseEntity {
  const ExpenseModel({
    required super.month,
    required super.items,
    required super.totalPrice,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        month: json['month'] ?? '',
        totalPrice: json['total'] ?? 0.0,
        items: json['items'] != null
            ? List<ExpenseItemModel>.from(
                json['items'].map((e) => ExpenseItemModel.fromJson(e)))
            : [],
      );
}
