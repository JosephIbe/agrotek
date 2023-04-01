import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

import 'package:agenpo/domain/entities/generate_otp_params.dart';
import 'package:agenpo/domain/entities/login_params.dart';
import 'package:agenpo/domain/entities/farmer_register_params.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> loginUser({required LoginParams params});
  Future<dynamic> registerUser({required FarmerRegisterParams params});
  Future<dynamic> generateOTP({required GenerateOTPParams params});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {

  final APIClient client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<void> loginUser({required LoginParams params}) async {
    return await client.login(pathSegment: APIConstants.login, params: params);
  }

  @override
  Future<void> registerUser({required FarmerRegisterParams params}) async {
    return await client.register(pathSegment: APIConstants.register, params: params);
  }

  @override
  Future<dynamic> generateOTP({required dynamic params}) async {
    return await client.generateOTP(pathSegment: APIConstants.generateOTP, params: params);
  }

}