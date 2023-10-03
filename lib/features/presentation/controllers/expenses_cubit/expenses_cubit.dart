import 'package:expenses/core/usecase/base_use_case.dart';
import 'package:expenses/features/presentation/controllers/expenses_cubit/expenses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/usecases/get_data_usecase.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final GetExpensesDataUseCase getExpensesDataUseCase;

  ExpensesCubit(this.getExpensesDataUseCase): super(const ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  Future<void> get getExpensesData async {
    emit(const GetExpensesLoadingState());
    final result = await getExpensesDataUseCase(const NoParameters());
    result.fold(
      (l) => emit(GetExpensesErrorState(error: l.message)),
      (r) => emit(GetExpensesSuccessState(r)),
    );
  }
}
