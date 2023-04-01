import 'package:agenpo/data/data_sources/transactions_remote_data_source.dart';
import 'package:agenpo/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {

  final TransactionsRemoteDataSource dataSource;
  TransactionsRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> getAllTransactions() async {
    return await dataSource.getAllTransactions();
  }

}