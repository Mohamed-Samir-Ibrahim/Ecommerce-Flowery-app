import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flowery/domain/use_case/profile_use_case/cities_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_view_model.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';

import 'profile_view_model_test.mocks.dart';

@GenerateMocks([cities_use_case])
void main() {
  late Mockcities_use_case mockCitiesUseCase;
  late ProfileViewModel viewModel;

  setUp(() {
    mockCitiesUseCase = Mockcities_use_case();
    viewModel = ProfileViewModel(mockCitiesUseCase);
  });

  test('getCities emits success state with data', () async {
    final fakeCities = [Citiesentity(id: 1, nameEn: "Cairo", nameAr: 'القاهرة')];
    when(mockCitiesUseCase.get()).thenAnswer((_) async => Success(fakeCities));

    await viewModel.getCities();

    expect(viewModel.state.status, ProfileStates.success);
    expect(viewModel.state.citiesentity, isNotNull);
    expect(viewModel.state.citiesentity!.first.nameEn, "Cairo");
  });

  test('Getstates emits success state with data', () async {
    final fakeStates = [statesentity(city_name_en: 'Nasr City', governorate_id: 1, id: 2, city_name_ar: 'مدينة نصر')];
    when(mockCitiesUseCase.getstates()).thenAnswer((_) async => Success(fakeStates));

    await viewModel.Getstates();

    expect(viewModel.state.status, ProfileStates.success);
    expect(viewModel.state.stateentity, isNotEmpty);
  });

  test('SaveAddress emits success state with saved address data', () async {
    final fakeAddress = Addaddress();
    final successResult = Success<Addaddress>(fakeAddress);

    when(mockCitiesUseCase.SaveAddress(any)).thenAnswer((_) async => successResult);

    // Fill text controllers
    viewModel.username.text = 'Test User';
    viewModel.phone.text = '123456789';
    viewModel.street.text = 'Main Street';
    viewModel.selectedCity = 'Cairo';

    await viewModel.SaveAddress();

    expect(viewModel.state.status, ProfileStates.success);
    expect(viewModel.state.saveAddress, equals(fakeAddress));
  });

  test('SaveAddress emits error state on failure', () async {
    final errorResult = Error<Addaddress>("Failed to save address" as Exception?);

    when(mockCitiesUseCase.SaveAddress(any)).thenAnswer((_) async => errorResult);

    // Fill text controllers
    viewModel.username.text = 'Test User';
    viewModel.phone.text = '123456789';
    viewModel.street.text = 'Main Street';
    viewModel.selectedCity = 'Cairo';

    await viewModel.SaveAddress();

    expect(viewModel.state.status, ProfileStates.error);
    expect(viewModel.state.message, "Failed to save address");
  });
}
