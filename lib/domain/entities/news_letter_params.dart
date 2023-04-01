import 'package:equatable/equatable.dart';

class NewsLetterParams extends Equatable {

  final String email;
  const NewsLetterParams({required this.email});

  Map<String, dynamic> toJson()=> {
    "newsletter": {
      "email": email
    }
  };

  @override
  List<Object?> get props => [email];

}