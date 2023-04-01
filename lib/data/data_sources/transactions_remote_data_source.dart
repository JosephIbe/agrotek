import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

abstract class TransactionsRemoteDataSource {
  Future<dynamic> getAllTransactions();
}

class TransactionsRemoteDataSourceImpl extends TransactionsRemoteDataSource {

  final APIClient client;
  TransactionsRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getAllTransactions() async {
    return await client.getAllTransactions(pathSegment: APIConstants.getAllTransactions);
  }

}