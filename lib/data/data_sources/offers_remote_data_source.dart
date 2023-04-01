import 'dart:developer';

import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';
import 'package:agenpo/domain/entities/accept_offer_params.dart';

abstract class OffersRemoteDataSource {
  Future<dynamic> getAllOffers();
  Future<dynamic> acceptOffer({required AcceptOfferParams params});
}

class OffersRemoteDataSourceImpl extends OffersRemoteDataSource {

  final APIClient client;
  OffersRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getAllOffers() async {
    return await client.getAllOffers(pathSegment: APIConstants.getAllOffers);
  }

  @override
  Future<dynamic> acceptOffer({required AcceptOfferParams params}) async {
    final response = await client.acceptOffer(pathSegment: APIConstants.acceptOffer, params: params);
    log('accept offer response in ds:\n$response');
    return response;
  }

}