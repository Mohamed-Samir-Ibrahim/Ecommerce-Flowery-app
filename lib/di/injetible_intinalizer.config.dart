// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source/remote_data_source/auth_remote_data_source/signup/signup_remote_data_source_contract.dart'
    as _i779;
import '../data/data_source/remote_data_source/auth_remote_data_source/signup/signup_remote_data_source_impl.dart'
    as _i715;
import '../data/di.dart' as _i21;
import '../data/repository_implementation/auth_repository_implementation/signup_repository_impl.dart'
    as _i717;
import '../data/web_services/WebServices.dart' as _i995;
import '../domain/repository_contract/auth_repository_contract/signup/signup_repository.dart'
    as _i431;
import '../domain/use_case/auth_use_case/signup_use_case.dart' as _i179;
import '../presentation/auth/cubit/auth_view_model.dart' as _i851;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.ProvideLogger());
    gh.singleton<_i361.Dio>(
      () => dioModule.ProvideDio(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i995.WebServices>(
      () => dioModule.ProvideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i779.SignupRemoteDataSourceContract>(
      () => _i715.SignUpRemoteDataSourceImpl(
        webServices: gh<_i995.WebServices>(),
      ),
    );
    gh.factory<_i431.SignupRepository>(
      () => _i717.SignUpRepositoryImpl(
        signupRemoteDataSourceContract:
            gh<_i779.SignupRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i179.SignUpUseCase>(
      () => _i179.SignUpUseCase(signupRepository: gh<_i431.SignupRepository>()),
    );
    gh.factory<_i851.AuthViewModel>(
      () => _i851.AuthViewModel(signUpUseCase: gh<_i179.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i21.DioModule {}
