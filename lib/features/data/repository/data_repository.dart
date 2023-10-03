import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expenses/core/error/failure.dart';
import 'package:expenses/features/data/data_source/get_data_remote_data_source.dart';
import 'package:expenses/features/domin/entities/expense.dart';
import 'package:expenses/features/domin/repository/base_data_repository.dart';

class DataRepository extends BaseDataRepository {
  final BaseDataRemoteDataSource expenseRemoteDataSource;

  DataRepository(this.expenseRemoteDataSource);

  @override
  Future<Either<Failure, List<ExpenseEntity>>> getData() async {
    try {
      final result = await expenseRemoteDataSource.getData();
      return Right(result);
    } on DioException catch (e) {
      print(e.error);
      return Left(ServerFailure(e.message!));
    }on SocketException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
