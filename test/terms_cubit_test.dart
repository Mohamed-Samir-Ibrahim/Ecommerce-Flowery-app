import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';
import 'package:flowery/domain/use_case/Profile_use_case/terms_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/terms/terms_cubit.dart';
import 'package:flowery/presentation/home/tabs/profile/terms/terms_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'terms_cubit_test.mocks.dart';

@GenerateMocks([TermsUseCase])
void main() {
  group('TermsCubit', () {
    late MockTermsUseCase mockUseCase;
    late TermsCubit cubit;

    setUp(() {
      mockUseCase = MockTermsUseCase();
      cubit = TermsCubit(mockUseCase);
    });

    final termsList = [
      TermsEntity(
        section: 'intro',
        title: {'en': 'Welcome', 'ar': 'أهلاً'},
        content: {'en': 'Hello', 'ar': 'مرحباً'},
        style: {},
      )
    ];

    blocTest<TermsCubit, TermsState>(
      'emits [TermsLoading, TermsLoaded] when successful',
      build: () {
        when(mockUseCase()).thenAnswer((_) async => termsList);
        return cubit;
      },
      act: (cubit) => cubit.fetchTerms(),
      expect: () => [isA<TermsLoading>(), isA<TermsLoaded>()],
    );

    blocTest<TermsCubit, TermsState>(
      'emits [TermsLoading, TermsError] when an error occurs',
      build: () {
        when(mockUseCase()).thenThrow(Exception('Failed'));
        return cubit;
      },
      act: (cubit) => cubit.fetchTerms(),
      expect: () => [isA<TermsLoading>(), isA<TermsError>()],
    );
  });
}