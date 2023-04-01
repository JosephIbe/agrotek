import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

abstract class KYCRemoteDataSource {
  Future<dynamic> validateBVN({required String bvn});
}

class KYCRemoteDataSourceImpl extends KYCRemoteDataSource {

  final APIClient client;
  KYCRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> validateBVN({required String bvn}) async {
    return await client.validateBVN(pathSegment: APIConstants.validateBVN(bvn));
  }

}