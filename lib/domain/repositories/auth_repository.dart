import 'package:agenpo/domain/entities/farmer_register_params.dart';
import 'package:agenpo/domain/entities/generate_otp_params.dart';
import 'package:agenpo/domain/entities/login_params.dart';

abstract class AuthRepository {
  Future<dynamic> loginUser({required LoginParams params});
  Future<dynamic> registerUser({required FarmerRegisterParams params});
  Future<dynamic> generateOTP({required GenerateOTPParams params});
}