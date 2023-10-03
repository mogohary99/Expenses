import 'package:dartz/dartz.dart';
import 'package:expenses/core/error/failure.dart';

import '../entities/expense.dart';

abstract class BaseDataRepository{
Future<Either<Failure,List<ExpenseEntity>>>  getData();
}