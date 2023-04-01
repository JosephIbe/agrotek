import 'package:equatable/equatable.dart';

class FarmerRegisterParams extends Equatable {

  final String email;
  final String? password;
  final String channel;
  final String role;
  final String phone;
  final String? fullName;
  final String firstName;
  final String lastName;

  const FarmerRegisterParams({
    required this.email,
    this.password,
    required this.channel,
    required this.role,
    required this.phone,
    required this.fullName,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
    "user": {
      "email": email,
      "phone_number": phone,
      "password": password,
      "channel": "mobile",
      "role": role,
      "name": fullName,
      "first_name": firstName,
      "last_name": lastName
    }
  };

  @override
  List<Object?> get props => [email, password, channel, role, phone, fullName, firstName, lastName];

}