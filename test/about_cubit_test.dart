import 'package:flowery/domain/entity/Profile_entity/about_entity.dart';
import 'package:flowery/domain/use_case/Profile_use_case/about_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/about/about_cubit.dart';
import 'package:flowery/presentation/home/tabs/profile/about/about_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'about_cubit_test.mocks.dart';

@GenerateMocks([AboutUseCase])
void main() {
  group('AboutCubit', () {
    late MockAboutUseCase mockUseCase;
    late AboutCubit cubit;

    setUp(() {
      mockUseCase = MockAboutUseCase();
      cubit = AboutCubit(mockUseCase);
    });

    final aboutList = [
      AboutEntity(
        section: 'intro',
        title: {'en': 'Welcome', 'ar': 'أهلاً'},
        content: {'en': 'Hello', 'ar': 'مرحباً'},
        style: {},
      ),
    ];

    blocTest<AboutCubit, AboutState>(
      'emits [AboutLoading, AboutLoaded] when successful',
      build: () {
        when(mockUseCase()).thenAnswer((_) async => aboutList);
        return cubit;
      },
      act: (cubit) => cubit.fetchAbout(),
      expect: () => [isA<AboutLoading>(), isA<AboutLoaded>()],
    );

    blocTest<AboutCubit, AboutState>(
      'emits [AboutLoading, AboutError] when an error occurs',
      build: () {
        when(mockUseCase()).thenThrow(Exception('Failed to load'));
        return cubit;
      },
      act: (cubit) => cubit.fetchAbout(),
      expect: () => [isA<AboutLoading>(), isA<AboutError>()],
    );
  });
}