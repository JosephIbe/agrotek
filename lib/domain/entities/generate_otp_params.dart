import 'package:equatable/equatable.dart';

class GenerateOTPParams extends Equatable {

  final String email;
  const GenerateOTPParams({required this.email});

  Map<String, dynamic> toJson()=>{
    "otp": {
      "email": email
    }
  };

  @override
  List<Object?> get props => [email];

}