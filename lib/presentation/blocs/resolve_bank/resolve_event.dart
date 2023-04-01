part of 'resolve_bloc.dart';

abstract class ResolveEvent extends Equatable {
  const ResolveEvent();

  @override
  List<Object> get props => [];

}

class ResolveBankAccountEvent extends ResolveEvent {

  final ResolveBankAccountParams params;
  const ResolveBankAccountEvent({required this.params});

  @override
  List<Object> get props => [params];

}