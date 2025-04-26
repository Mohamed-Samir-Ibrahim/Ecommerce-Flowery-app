import 'package:flowery/domain/use_case/Profile_use_case/terms_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'terms_state.dart';

@singleton
class TermsCubit extends Cubit<TermsState> {
  final TermsUseCase getTermsUseCase;

  TermsCubit(this.getTermsUseCase) : super(TermsInitial());

  Future<void> fetchTerms() async {
    emit(TermsLoading());
    try {
      final terms = await getTermsUseCase();
      emit(TermsLoaded(terms));
    } catch (e) {
      emit(TermsError(e.toString()));
    }
  }
}