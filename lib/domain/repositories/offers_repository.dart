import 'package:agenpo/domain/entities/accept_offer_params.dart';

abstract class OffersRepository {
  Future<dynamic> getAllOffers();
  Future<dynamic> acceptOffer({required AcceptOfferParams params});
}