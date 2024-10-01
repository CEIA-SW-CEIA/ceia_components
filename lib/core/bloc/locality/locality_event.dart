part of 'locality_bloc.dart';

sealed class LocalityEvent {}

class FetchUfEvent extends LocalityEvent {}

class FetchCityEvent extends LocalityEvent {
  final String uf;

  FetchCityEvent({required this.uf});
}

class FetchAdressEvent extends LocalityEvent {
  final String zipCode;

  FetchAdressEvent({required this.zipCode});
}
