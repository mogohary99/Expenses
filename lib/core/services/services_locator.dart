import 'package:expenses/features/data/repository/data_repository.dart';
import 'package:expenses/features/domin/repository/base_data_repository.dart';
import 'package:expenses/features/domin/usecases/get_data_usecase.dart';
import 'package:expenses/features/presentation/controllers/expenses_cubit/expenses_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/data_source/get_data_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///cubit
  sl.registerFactory(() => ExpensesCubit(sl()));

  ///use case
  sl.registerLazySingleton(() => GetExpensesDataUseCase(sl()));

  ///repository
  sl.registerLazySingleton<BaseDataRepository>(
        () => DataRepository(sl()),
  );
  ///remote data source
  sl.registerLazySingleton<BaseDataRemoteDataSource>(
        () => ExpenseRemoteDataSource(),
  );
}