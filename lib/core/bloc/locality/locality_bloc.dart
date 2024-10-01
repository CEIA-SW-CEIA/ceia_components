import 'package:ceia_components/core/model/value_object/adress.dart';
import 'package:ceia_components/core/model/value_object/city.dart';
import 'package:ceia_components/core/model/value_object/uf.dart';
import 'package:ceia_components/core/repository/locality/locality_repository_impl.dart';
import 'package:ceia_components/core/repository/zip_code/zip_code_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locality_event.dart';
part 'locality_state.dart';

class LocalityBloc extends Bloc<LocalityEvent, LocalityState> {
  final LocalityRepositoryImpl localityRepository;
  final ZipCodeRepositoryImpl zipCodeRepository;

  LocalityBloc({required this.localityRepository, required this.zipCodeRepository}) : super(InitialState()) {
    on<FetchUfEvent>((event, emit) => fetchUf(event, emit));
    on<FetchCityEvent>((event, emit) => fetchCity(event, emit));
    on<FetchAdressEvent>((event, emit) => fetchAdress(event, emit));
  }

  void fetchUf(FetchUfEvent event, Emitter<LocalityState> emit) async {
    emit(FetchingState());

    final result = await localityRepository.getUfList();

    if (result.isError) {
      return emit(ErrorState(message: result.message));
    }

    final ufs = result.data as Map<String, Uf>;

    emit(FetchedUfState(ufs: ufs));
  }

  void fetchCity(FetchCityEvent event, Emitter<LocalityState> emit) async {
    emit(FetchingState());

    final result = await localityRepository.getCitiesByUf(event.uf);

    if (result.isError) {
      return emit(ErrorState(message: result.message));
    }

    final cities = result.data as Map<String, City>;

    emit(FetchedCityState(cities: cities));
  }

  void fetchAdress(FetchAdressEvent event, Emitter<LocalityState> emit) async {
    emit(FetchingState());

    final result = await zipCodeRepository.getAdressByZipCode(event.zipCode);

    if (result.isError) {
      return emit(ErrorState(message: result.message));
    }

    final adress = result.data as Adress;

    emit(FetchedAdressState(adress: adress));
  }
}
