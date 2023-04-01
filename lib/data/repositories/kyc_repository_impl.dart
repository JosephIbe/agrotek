import 'package:agenpo/data/data_sources/kyc_remote_data_source.dart';
import 'package:agenpo/domain/repositories/kyc_repository.dart';

class KYCRepositoryImpl extends KYCRepository {

  final KYCRemoteDataSource dataSource;
  KYCRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> validateBVN({required String bvn}) async {
    return await dataSource.validateBVN(bvn: bvn);
  }

}