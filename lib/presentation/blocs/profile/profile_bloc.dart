import 'dart:async';
import 'dart:convert';

import 'package:agenpo/data/models/profile_response_model.dart';
import 'package:agenpo/domain/repositories/profile_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final ProfileRepository _repository;

  ProfileBloc({required ProfileRepository repository})
      : _repository = repository, super(ProfileStateInitial()) {
    on<GetUserProfileEvent>(_getProfile);
  }

  _getProfile(GetUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileStateLoading());

    http.Response response = await _repository.getUserProfile();

    if(response.statusCode == 200){
      print('get profile response in bloc:\n$response');

      final responseModel = ProfileResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data.toJson()}');

      emit(ProfileStateGetProfileSuccess(responseModel: responseModel));

    } else {
      print('get profile response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const ProfileStateFailure(failureMessage: 'Could Not Get Your Profile'));
    }
  }

}
