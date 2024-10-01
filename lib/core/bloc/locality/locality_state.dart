part of 'locality_bloc.dart';

sealed class LocalityState {}

class InitialState extends LocalityState {}

class FetchingState extends LocalityState {}

class FetchedUfState extends LocalityState {
  final Map<String, Uf> ufs;

  FetchedUfState({required this.ufs});
}

class FetchedCityState extends LocalityState {
  final Map<String, City> cities;

  FetchedCityState({required this.cities});
}

class FetchedAdressState extends LocalityState {
  final Adress adress;

  FetchedAdressState({required this.adress});
}

class ErrorState extends LocalityState {
  final String message;

  ErrorState({required this.message});
}
