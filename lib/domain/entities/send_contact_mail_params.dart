import 'package:equatable/equatable.dart';

class SendContactMailParams extends Equatable {

  final String fullName;
  final String email;
  final String phoneNumber;
  final String message;
  final String channel;

  const SendContactMailParams({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.message,
    required this.channel,
  });

  Map<String, dynamic> toJson() => {
    "contact_mail": {
      "fullname": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "message": message,
      "channel": channel
    }
  };

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
    message,
    channel
  ];

}