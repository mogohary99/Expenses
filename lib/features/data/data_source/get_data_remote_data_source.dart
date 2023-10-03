import 'package:dio/dio.dart';
import 'package:expenses/features/data/models/expense_model.dart';

abstract class BaseDataRemoteDataSource {
  Future<List<ExpenseModel>> getData();
}

class ExpenseRemoteDataSource extends BaseDataRemoteDataSource {
  final Dio _dio = Dio();

  ExpenseRemoteDataSource();

  @override
  Future<List<ExpenseModel>> getData() async {
    final response = await Future.delayed(const Duration(seconds: 5))
        .then((value) => _dio.get('https://apimocha.com/expenses/e'));
    print(response.data);
    return List<ExpenseModel>.from(
      response.data.map(
        (e) => ExpenseModel.fromJson(e),
      ),
    );
  }
}


