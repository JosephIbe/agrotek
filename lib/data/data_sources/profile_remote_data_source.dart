import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

abstract class ProfileRemoteDataSource {
  Future<dynamic> getUserProfile();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {

  final APIClient client;
  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getUserProfile() async {
    return await client.getProfile(pathSegment: APIConstants.getUserProfile);
  }

}