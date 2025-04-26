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
import '../data/data_source/remote_data_source/cart_remote_data_source/cart_remote_data_source_contract.dart'
    as _i12;
import '../data/data_source/remote_data_source/cart_remote_data_source/cart_remote_data_source_impl.dart'
    as _i106;
import '../data/data_source/remote_data_source/Category_remote_data_source/Category_remote_data_source_contract.dart'
    as _i914;
import '../data/data_source/remote_data_source/Category_remote_data_source/Category_remote_data_source_implementation.dart'
    as _i672;
import '../data/data_source/remote_data_source/home_remote_data_source/best_seller_contract.dart'
    as _i694;
import '../data/data_source/remote_data_source/home_remote_data_source/best_seller_impl.dart'
    as _i463;
import '../data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_contract.dart'
    as _i680;
import '../data/data_source/remote_data_source/home_remote_data_source/home_remote_data_source_implementation.dart'
    as _i782;
import '../data/data_source/remote_data_source/home_remote_data_source/product_data_source_contract.dart'
    as _i713;
import '../data/data_source/remote_data_source/home_remote_data_source/product_data_source_impl.dart'
    as _i323;
import '../data/data_source/remote_data_source/payment_method_data_source/payment_remote_data_source_contract.dart'
    as _i463;
import '../data/data_source/remote_data_source/payment_method_data_source/payment_remote_data_source_implementation.dart'
    as _i140;
import '../data/data_source/remote_data_source/profile_remote_data_source/profile_data_source_contract.dart'
    as _i24;
import '../data/data_source/remote_data_source/profile_remote_data_source/profile_data_source_impl.dart'
    as _i37;
import '../data/data_source/remote_data_source/user_address_data_source/user_address_remote_data_source_contract.dart'
    as _i553;
import '../data/data_source/remote_data_source/user_address_data_source/user_address_remote_data_source_implementation.dart'
    as _i17;
import '../data/repository_implementation/auth_repository_implementation/auth_repository_implementation.dart'
    as _i277;
import '../data/repository_implementation/cart_repository_impl/cart_repository_impl.dart'
    as _i18;
import '../data/repository_implementation/category_repository_implementation/category_repository_implementation.dart'
    as _i123;
import '../data/repository_implementation/home_repository_implementation/best_seller_rep_impl.dart'
    as _i384;
import '../data/repository_implementation/home_repository_implementation/home_repository_implementation.dart'
    as _i645;
import '../data/repository_implementation/home_repository_implementation/product_repo_impl.dart'
    as _i1013;
import '../data/repository_implementation/payment_repository_implementation/payment_repository_implementation.dart'
    as _i887;
import '../data/repository_implementation/profile_repository_impl/profile_repository_impl.dart'
    as _i23;
import '../data/repository_implementation/user_address_repository_implementation/user_address_repository_implementation.dart'
    as _i783;
import '../data/web_services/WebServices.dart' as _i995;
import '../domain/repository_contract/auth_repository_contract/auth_repository_contract.dart'
    as _i284;
import '../domain/repository_contract/cart_repository_contract/cart_repository_contract.dart'
    as _i756;
import '../domain/repository_contract/category_repository_contract/category_repository_contract.dart'
    as _i555;
import '../domain/repository_contract/home_repository_contract/best_seller_repository.dart'
    as _i670;
import '../domain/repository_contract/home_repository_contract/home_repository_contract.dart'
    as _i1053;
import '../domain/repository_contract/home_repository_contract/product_repository.dart'
    as _i14;
import '../domain/repository_contract/payment_repository_contract/payment_repository_contract.dart'
    as _i312;
import '../domain/repository_contract/profile_repository_contract/profile_repository_contract.dart'
    as _i517;
import '../domain/repository_contract/user_address_repository_contract/user_address_repository_contract.dart'
    as _i128;
import '../domain/use_case/auth_use_case/forget_password_use_case.dart'
    as _i439;
import '../domain/use_case/auth_use_case/login_use_case.dart' as _i6;
import '../domain/use_case/auth_use_case/reset_password_use_case.dart' as _i455;
import '../domain/use_case/auth_use_case/signup_use_case.dart' as _i179;
import '../domain/use_case/auth_use_case/verify_reset_use_case.dart' as _i86;
import '../domain/use_case/cart_use_case/cart_use_case.dart' as _i368;
import '../domain/use_case/cart_use_case/delete_item_use_case.dart' as _i1002;
import '../domain/use_case/cart_use_case/get_cart_use_case.dart' as _i111;
import '../domain/use_case/category_use_case/category_use_case.dart' as _i477;
import '../domain/use_case/home_use_case/best_seller_use_case.dart' as _i554;
import '../domain/use_case/home_use_case/category_product_use_case.dart'
    as _i579;
import '../domain/use_case/home_use_case/get_all_product_use_case.dart'
    as _i690;
import '../domain/use_case/home_use_case/home_use_case.dart' as _i817;
import '../domain/use_case/home_use_case/occasion_product_use_case.dart'
    as _i1022;
import '../domain/use_case/home_use_case/product_use_case.dart' as _i118;
import '../domain/use_case/payment_use_case/checkout_session_use_case.dart'
    as _i824;
import '../domain/use_case/payment_use_case/create_cash_order_use_case.dart'
    as _i87;
import '../domain/use_case/profile_use_case/cities_use_case.dart' as _i627;
import '../domain/use_case/user_address_use_case/get_logged_user_address_use_case.dart'
    as _i327;
import '../presentation/auth/cubit/auth_view_model.dart' as _i851;
import '../presentation/home/tabs/cart/cart_view_model.dart' as _i1008;
import '../presentation/home/tabs/category/category_view_model.dart' as _i177;
import '../presentation/home/tabs/home/best_seller_view_model.dart' as _i891;
import '../presentation/home/tabs/home/home_view_model.dart' as _i540;
import '../presentation/home/tabs/profile/profile_view_model.dart' as _i35;

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
    gh.factory<_i713.ProductDataSourceContract>(
      () => _i323.ProductDataSourceImpl(client: gh<_i995.WebServices>()),
    );
    gh.factory<_i694.BestSellerContract>(
      () => _i463.bestSellerImpl(client: gh<_i995.WebServices>()),
    );
    gh.factory<_i463.PaymentRemoteDataSourceContract>(
      () =>
          _i140.PaymentRemoteDataSourceImplementation(gh<_i995.WebServices>()),
    );
    gh.factory<_i553.UserAddressRemoteDataSourceContract>(
      () => _i17.UserAddressRemoteDataSourceImplementation(
        gh<_i995.WebServices>(),
      ),
    );
    gh.factory<_i12.cart_remote_data_source_contract>(
      () => _i106.cart_remote_data_source_impl(gh<_i995.WebServices>()),
    );
    gh.factory<_i24.profileDataSourceContract>(
      () => _i37.ProfileDataSourceImpl(gh<_i995.WebServices>()),
    );
    gh.factory<_i658.AuthRemoteDataSourceContract>(
      () => _i793.AuthRemoteDataSourceImplementation(gh<_i995.WebServices>()),
    );
    gh.factory<_i680.HomeRemoteDataSourceContract>(
      () => _i782.HomeRemoteDataSourceImplementation(gh<_i995.WebServices>()),
    );
    gh.factory<_i914.Category_Remote_Data_Source_Contract>(
      () => _i672.CategoryRemoteDataSourceImplementation(
        client: gh<_i995.WebServices>(),
      ),
    );
    gh.factory<_i670.BestSellerRepository>(
      () => _i384.bestSellerRepositoryImpl(
        bestSellerContractt: gh<_i694.BestSellerContract>(),
      ),
    );
    gh.factory<_i128.UserAddressRepositoryContract>(
      () => _i783.UserAddressRepositoryImplementation(
        gh<_i553.UserAddressRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i1053.HomeRepositoryContract>(
      () => _i645.HomeRepositoryImplementation(
        gh<_i680.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i690.GetAllProductUseCase>(
      () => _i690.GetAllProductUseCase(gh<_i1053.HomeRepositoryContract>()),
    );
    gh.factory<_i14.ProductRepo>(
      () => _i1013.ProductRepoImpl(gh<_i713.ProductDataSourceContract>()),
    );
    gh.factory<_i817.HomeUseCase>(
      () => _i817.HomeUseCase(gh<_i1053.HomeRepositoryContract>()),
    );
    gh.factory<_i517.ProfileRepositoryContract>(
      () => _i23.ProfileRepositoryImpl(gh<_i24.profileDataSourceContract>()),
    );
    gh.factory<_i627.cities_use_case>(
      () => _i627.cities_use_case(gh<_i517.ProfileRepositoryContract>()),
    );
    gh.factory<_i1022.OccasionProductUseCase>(
      () => _i1022.OccasionProductUseCase(gh<_i1053.HomeRepositoryContract>()),
    );
    gh.factory<_i312.PaymentRepositoryContract>(
      () => _i887.PaymentRepositoryImplementation(
        gh<_i463.PaymentRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i555.CategoryRepositoryContract>(
      () => _i123.category_repository_implementation(
        obj_Category_Remote_Data_Source_Contract:
            gh<_i914.Category_Remote_Data_Source_Contract>(),
      ),
    );
    gh.factory<_i284.AuthRepositoryContract>(
      () => _i277.AuthRepositoryImplementation(
        gh<_i658.AuthRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i477.CategoryUseCase>(
      () => _i477.CategoryUseCase(
        obj_category_Repository_Contract:
            gh<_i555.CategoryRepositoryContract>(),
      ),
    );
    gh.singleton<_i540.HomeViewModel>(
      () => _i540.HomeViewModel(
        gh<_i817.HomeUseCase>(),
        gh<_i1022.OccasionProductUseCase>(),
      ),
    );
    gh.factory<_i756.cart_repoistory_contract>(
      () => _i18.cart_repository_impl(
        cart: gh<_i12.cart_remote_data_source_contract>(),
      ),
    );
    gh.factory<_i327.GetLoggedUserAddressUseCase>(
      () => _i327.GetLoggedUserAddressUseCase(
        gh<_i128.UserAddressRepositoryContract>(),
      ),
    );
    gh.factory<_i554.BestSellerUseCase>(
      () => _i554.BestSellerUseCase(
        bestSellerRepository: gh<_i670.BestSellerRepository>(),
      ),
    );
    gh.factory<_i455.ResetPasswordUseCase>(
      () => _i455.ResetPasswordUseCase(gh<_i284.AuthRepositoryContract>()),
    );
    gh.factory<_i824.CheckoutSessionUseCase>(
      () => _i824.CheckoutSessionUseCase(gh<_i312.PaymentRepositoryContract>()),
    );
    gh.factory<_i87.CreateCashOrderUseCase>(
      () => _i87.CreateCashOrderUseCase(gh<_i312.PaymentRepositoryContract>()),
    );
    gh.factory<_i579.CategoryProductUseCase>(
      () => _i579.CategoryProductUseCase(gh<_i1053.HomeRepositoryContract>()),
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
    gh.factory<_i118.ProductUseCase>(
      () => _i118.ProductUseCase(gh<_i14.ProductRepo>()),
    );
    gh.singleton<_i891.BestSellerViewModel>(
      () => _i891.BestSellerViewModel(
        bestSellerUseCase: gh<_i554.BestSellerUseCase>(),
      ),
    );
    gh.factory<_i6.login_use_case>(
      () => _i6.login_use_case(
        obj_login_repository_contract: gh<_i284.AuthRepositoryContract>(),
      ),
    );
    gh.factory<_i177.CategoryViewModel>(
      () => _i177.CategoryViewModel(
        gh<_i817.HomeUseCase>(),
        gh<_i477.CategoryUseCase>(),
        gh<_i579.CategoryProductUseCase>(),
        gh<_i690.GetAllProductUseCase>(),
      ),
    );
    gh.singleton<_i35.ProfileViewModel>(
      () => _i35.ProfileViewModel(gh<_i627.cities_use_case>()),
    );
    gh.factory<_i368.cart_usecase>(
      () => _i368.cart_usecase(gh<_i756.cart_repoistory_contract>()),
    );
    gh.factory<_i1002.DeleteItemUseCase>(
      () => _i1002.DeleteItemUseCase(gh<_i756.cart_repoistory_contract>()),
    );
    gh.factory<_i111.getCartUseCase>(
      () => _i111.getCartUseCase(gh<_i756.cart_repoistory_contract>()),
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
    gh.singleton<_i1008.CartViewModel>(
      () => _i1008.CartViewModel(
        gh<_i824.CheckoutSessionUseCase>(),
        gh<_i87.CreateCashOrderUseCase>(),
        gh<_i327.GetLoggedUserAddressUseCase>(),
        gh<_i368.cart_usecase>(),
        gh<_i111.getCartUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i219.DioModule {}
