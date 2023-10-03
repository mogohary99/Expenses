import 'package:dartz/dartz.dart';
import 'package:expenses/core/error/failure.dart';
import 'package:expenses/core/usecase/base_use_case.dart';
import 'package:expenses/features/domin/entities/expense.dart';

import '../repository/base_data_repository.dart';

class GetExpensesDataUseCase extends BaseUseCase<List<ExpenseEntity>, NoParameters> {
  final BaseDataRepository baseDataRepository;

  GetExpensesDataUseCase(this.baseDataRepository);

  @override
  Future<Either<Failure, List<ExpenseEntity>>> call(
      NoParameters parameters) async {
    return await baseDataRepository.getData();
  }
}
