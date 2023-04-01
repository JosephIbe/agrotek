part of 'accept_offer_bloc.dart';

abstract class AcceptOfferEvent extends Equatable {
  const AcceptOfferEvent();

  @override
  List<Object?> get props => [];
}

class AcceptPendingOfferEvent extends AcceptOfferEvent {

  final AcceptOfferParams params;
  const AcceptPendingOfferEvent({required this.params});

  @override
  List<Object?> get props => [params];

}
