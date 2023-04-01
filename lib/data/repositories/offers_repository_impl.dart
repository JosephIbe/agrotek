import 'package:agenpo/data/core/api_constants.dart';
import 'package:agenpo/data/data_sources/offers_remote_data_source.dart';
import 'package:agenpo/domain/entities/accept_offer_params.dart';
import 'package:agenpo/domain/repositories/offers_repository.dart';

class OffersRepositoryImpl extends OffersRepository {

  final OffersRemoteDataSource dataSource;
  OffersRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> getAllOffers() async {
    return await dataSource.getAllOffers();
  }

  @override
  Future<dynamic> acceptOffer({required AcceptOfferParams params}) async {
    return await dataSource.acceptOffer(params: params);
  }

}