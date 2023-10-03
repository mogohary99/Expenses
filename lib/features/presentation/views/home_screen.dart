import 'package:expenses/features/domin/entities/expense.dart';
import 'package:expenses/features/presentation/components/error_widget.dart';
import 'package:expenses/features/presentation/components/home_body.dart';
import 'package:expenses/features/presentation/controllers/expenses_cubit/expenses_cubit.dart';
import 'package:expenses/features/presentation/controllers/expenses_cubit/expenses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        var cubit = ExpensesCubit.get(context);
        if (state is GetExpensesSuccessState) {
          List<ExpenseEntity> items = state.expenses;
          return HomeBody(items: items);
        }
        if(state is GetExpensesErrorState){
          return  ErrorScreen(error: state.error,);
        }
        return const LoadingWidget();
      },
    );
  }
}
