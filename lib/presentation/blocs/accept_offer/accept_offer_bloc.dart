import 'dart:async';
import 'dart:convert';

import 'package:agenpo/data/data_sources/accept_offer_response_model.dart';
import 'package:agenpo/domain/entities/accept_offer_params.dart';
import 'package:agenpo/domain/repositories/offers_repository.dart';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'accept_offer_event.dart';
part 'accept_offer_state.dart';

class AcceptOfferBloc extends Bloc<AcceptOfferEvent, AcceptOfferState> {

  final OffersRepository _repository;

  AcceptOfferBloc({required OffersRepository repository})
      : _repository = repository,
        super(AcceptOfferStateInitial()) {
    on<AcceptPendingOfferEvent>(_acceptOffer);
  }

  _acceptOffer(AcceptPendingOfferEvent event, Emitter<AcceptOfferState> emit) async {
    emit(AcceptOfferStateLoading());

    http.Response response = await _repository.acceptOffer(params: event.params);

    if(response.statusCode == 200){
      print('accept offer response in bloc:\n$response');

      final responseModel = AcceptOfferResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data}');

      emit(AcceptOfferStateSuccess(responseModel: responseModel));

    } else {
      print('accept offer response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const AcceptOfferStateFailure(failureMessage: 'Could Not Accept This Offer'));
    }
  }

}
