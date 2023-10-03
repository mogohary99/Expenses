import 'package:equatable/equatable.dart';

import '../../../domin/entities/expense.dart';

abstract class ExpensesState extends Equatable{
const ExpensesState();
}

class ExpensesInitial extends ExpensesState{
  const ExpensesInitial();
  @override
  List<Object?> get props => [];
}

class GetExpensesLoadingState extends ExpensesState{
  const GetExpensesLoadingState();
  @override
  List<Object?> get props => [];
}

class GetExpensesSuccessState extends ExpensesState{
  final List<ExpenseEntity> expenses;
  const GetExpensesSuccessState(this.expenses);
  @override
  List<Object?> get props => [expenses];
}

class GetExpensesErrorState extends ExpensesState{
  final String error;
  const GetExpensesErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

