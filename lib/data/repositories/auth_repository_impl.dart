import 'package:agenpo/data/data_sources/auth_remote_data_source.dart';
import 'package:agenpo/domain/entities/generate_otp_params.dart';
import 'package:agenpo/domain/entities/login_params.dart';
import 'package:agenpo/domain/entities/farmer_register_params.dart';
import 'package:agenpo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> loginUser({required LoginParams params}) async {
    return await dataSource.loginUser(params: params);
  }

  @override
  Future<dynamic> registerUser({required FarmerRegisterParams params}) async {
    return await dataSource.registerUser(params: params);
  }

  @override
  Future<dynamic> generateOTP({required GenerateOTPParams params}) async {
    return await dataSource.generateOTP(params: params);
  }

}