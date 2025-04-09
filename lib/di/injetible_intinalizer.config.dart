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

import '../core/dio_helper.dart' as _i219;
import '../data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart'
    as _i658;
import '../data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_implementation.dart'
    as _i793;
import '../data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_contract.dart'
    as _i680;
import '../data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_implementation.dart'
    as _i782;
import '../data/repository_implementation/auth_repository_implementation/auth_repository_implementation.dart'
    as _i277;
import '../data/repository_implementation/home_repository_implementation/home_repository_implementation.dart'
    as _i645;
import '../data/web_services/WebServices.dart' as _i995;
import '../domain/repository_contract/auth_repository_contract/auth_repository_contract.dart'
    as _i284;
import '../domain/repository_contract/home_repository_contract/home_repository_contract.dart'
    as _i1053;
import '../domain/use_case/auth_use_case/forget_password_use_case.dart'
    as _i439;
import '../domain/use_case/auth_use_case/login_use_case.dart' as _i6;
import '../domain/use_case/auth_use_case/reset_password_use_case.dart' as _i455;
import '../domain/use_case/auth_use_case/signup_use_case.dart' as _i179;
import '../domain/use_case/auth_use_case/verify_reset_use_case.dart' as _i86;
import '../domain/use_case/home_use_case/home_use_case.dart' as _i817;
import '../presentation/auth/cubit/auth_view_model.dart' as _i851;
import '../presentation/home/tabs/home/home_view_model.dart' as _i540;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDIO(gh<_i361.LogInterceptor>()),
    );
    gh.singleton<_i995.WebServices>(
      () => dioModule.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i658.AuthRemoteDataSourceContract>(
      () => _i793.AuthRemoteDataSourceImplementation(gh<_i995.WebServices>()),
    );
    gh.factory<_i680.HomeRemoteDataSourceContract>(
      () => _i782.HomeRemoteDataSourceImplementation(gh<_i995.WebServices>()),
    );
    gh.factory<_i1053.HomeRepositoryContract>(
      () => _i645.HomeRepositoryImplementation(
        gh<_i680.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i817.HomeUseCase>(
      () => _i817.HomeUseCase(gh<_i1053.HomeRepositoryContract>()),
    );
    gh.factory<_i284.AuthRepositoryContract>(
      () => _i277.AuthRepositoryImplementation(
        gh<_i658.AuthRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i455.ResetPasswordUseCase>(
      () => _i455.ResetPasswordUseCase(gh<_i284.AuthRepositoryContract>()),
    );
    gh.factory<_i439.ForgetPasswordUseCase>(
      () => _i439.ForgetPasswordUseCase(gh<_i284.AuthRepositoryContract>()),
    );
    gh.factory<_i179.SignupUseCase>(
      () => _i179.SignupUseCase(gh<_i284.AuthRepositoryContract>()),
    );
    gh.factory<_i86.VerifyResetUseCase>(
      () => _i86.VerifyResetUseCase(gh<_i284.AuthRepositoryContract>()),
    );
    gh.singleton<_i540.HomeViewModel>(
      () => _i540.HomeViewModel(gh<_i817.HomeUseCase>()),
    );
    gh.factory<_i6.login_use_case>(
      () => _i6.login_use_case(
        obj_login_repository_contract: gh<_i284.AuthRepositoryContract>(),
      ),
    );
    gh.singleton<_i851.AuthViewModel>(
      () => _i851.AuthViewModel(
        gh<_i439.ForgetPasswordUseCase>(),
        gh<_i86.VerifyResetUseCase>(),
        gh<_i6.login_use_case>(),
        gh<_i455.ResetPasswordUseCase>(),
        gh<_i179.SignupUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i219.DioModule {}
