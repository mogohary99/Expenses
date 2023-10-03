import 'package:equatable/equatable.dart';

import 'expense_item.dart';

class ExpenseEntity extends Equatable {
  final String month;
  final double totalPrice;
  final List<ExpenseItemEntity> items;

  const ExpenseEntity( {
    required this.month,
    required this.items,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [
        month,
        items,
    totalPrice,
      ];
}
