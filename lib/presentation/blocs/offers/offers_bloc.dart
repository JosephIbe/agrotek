import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agenpo/data/models/get_all_offers_response_model.dart';
import 'package:agenpo/domain/entities/accept_offer_params.dart';

import 'package:agenpo/domain/repositories/offers_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {

  OffersRepository _repository;

  OffersBloc({required OffersRepository repository})
      : assert (repository != null), _repository = repository,
        super(OffersStateInitial()) {
    on<GetAllOffersEvent>(_getAllOffers);
  }

  _getAllOffers(GetAllOffersEvent event, Emitter<OffersState> emit) async {
    emit(OffersStateLoading());

    http.Response response = await _repository.getAllOffers();

    if(response.statusCode == 200){
      print('get all offers response in bloc:\n$response');

      final responseModel = GetAllOffersResponseModel.fromJson(jsonDecode(response.body));
      // log('responseModel data:\n${responseModel.offers.first.toJson()}');

      emit(OffersStateGetAllSuccess(responseModel: responseModel));

    } else {
      print('get all offers response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const OffersStateFailure(failureMessage: 'Could Not Get All Offers'));
    }
  }

}
