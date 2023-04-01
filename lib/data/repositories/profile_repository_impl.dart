import 'package:agenpo/data/data_sources/profile_remote_data_source.dart';
import 'package:agenpo/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  final ProfileRemoteDataSource dataSource;
  ProfileRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> getUserProfile() async {
    return await dataSource.getUserProfile();
  }

}