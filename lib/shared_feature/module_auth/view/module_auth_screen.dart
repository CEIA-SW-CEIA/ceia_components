import 'package:ceia_components/core/model/aggregate/user_aggregate.dart';
import 'package:ceia_components/core/repository/auth/auth_repository_impl.dart';
import 'package:ceia_components/core/repository/permission/permission_repository_impl.dart';
import 'package:ceia_components/core/repository/person/person_repository_impl.dart';
import 'package:ceia_components/core/repository/user/user_repository_impl.dart';
import 'package:ceia_components/core/repository/user_aggregate/user_aggregate_repository_impl.dart';
import 'package:ceia_components/shared_feature/module_auth/bloc/module_auth_bloc.dart';
import 'package:ceia_components/utils/cache_utils.dart';
import 'package:ceia_components/utils/dialog_utils.dart';
import 'package:ceia_components/utils/routes_utils.dart';
import 'package:ceia_components/widgets/ceia_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef AuthenticateSuccess = Function(UserAggregate user);

class ModuleAuthScreen extends StatelessWidget {
  const ModuleAuthScreen({super.key, required this.token, this.onAuthenticateSuccess});

  final String? token;
  final AuthenticateSuccess? onAuthenticateSuccess;

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      RoutesUtils.redirectToAuthModule();
    }

    return BlocProvider(
      create: (context) => ModuleAuthBloc(
        AuthRepositoryImpl(),
        UserAggregateRepositoryImpl(
          UserRepositoryImpl(),
          PersonRepositoryImpl(),
          PermissionRepositoryImpl(),
        ),
      )..add(AuthenticateWithTokenEvent(token!)),
      child: LoginProdContent(
        onAuthenticateSuccess: onAuthenticateSuccess,
      ),
    );
  }
}

class LoginProdContent extends StatelessWidget {
  const LoginProdContent({super.key, this.onAuthenticateSuccess});

  final AuthenticateSuccess? onAuthenticateSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModuleAuthBloc, ModuleAuthState>(
      listener: (context, state) async {
        if (state is ErrorState) {
          DialogUtils.showInformativeErrorDialog(context, state.message);
        }

        if (state is SuccessState) {
          CacheUtils.saveUser(state.user);
          onAuthenticateSuccess?.call(state.user);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: CEIALoading(),
        );
      },
    );
  }
}
