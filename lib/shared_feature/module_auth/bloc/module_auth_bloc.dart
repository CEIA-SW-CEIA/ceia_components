import 'package:ceia_components/core/model/aggregate/user_aggregate.dart';
import 'package:ceia_components/core/model/exception/auth_exception.dart';
import 'package:ceia_components/core/repository/auth/auth_repository_impl.dart';
import 'package:ceia_components/core/repository/user_aggregate/user_aggregate_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
class ModuleAuthBloc extends Bloc<ModuleAuthEvent, ModuleAuthState> {
  final AuthRepositoryImpl _authRepository;
  final UserAggregateRepositoryImpl _userAggregateRepository;

  ModuleAuthBloc(this._authRepository, this._userAggregateRepository) : super(LoadingState()) {
    on<AuthenticateWithTokenEvent>(_onAuthenticateWithToken);
  }

  /// Realiza a authenticação do usuário por meio do token recebido.
  void _onAuthenticateWithToken(AuthenticateWithTokenEvent event, Emitter emit) async {
    emit(LoadingState());

    try {
      final user = await _authRepository.authenticateWithToken(event.token);

      final userAggregateResult = await _userAggregateRepository.read(user.uid);

      if (userAggregateResult.isError) {
        return emit(ErrorState(userAggregateResult.message));
      }

      emit(SuccessState(userAggregateResult.data));
    } on AuthException catch (authError) {
      emit(ErrorState(authError.toString()));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}

// Events
sealed class ModuleAuthEvent {}

class AuthenticateWithTokenEvent extends ModuleAuthEvent {
  final String token;

  AuthenticateWithTokenEvent(this.token);
}

// States
sealed class ModuleAuthState {}

class LoadingState extends ModuleAuthState {}

class SuccessState extends ModuleAuthState {
  final UserAggregate user;

  SuccessState(this.user);
}

class ErrorState extends ModuleAuthState {
  final String message;

  ErrorState(this.message);
}
