import 'package:equatable/equatable.dart';

class AcceptOfferParams extends Equatable {

  final int offerId;
  final int? producerId;

  const AcceptOfferParams({
    required this.offerId,
    this.producerId,
  });

  Map<String, dynamic> toJson() => {
    "offer_id": offerId,
    "producer_id":  producerId
  };

  @override
  List<Object?> get props => [offerId, producerId];

}