import 'package:flowery/domain/use_case/Profile_use_case/about_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'about_state.dart';

@injectable
class AboutCubit extends Cubit<AboutState> {
  final AboutUseCase useCase;
  AboutCubit(this.useCase) : super(AboutInitial());

  Future<void> fetchAbout() async {
    emit(AboutLoading());
    try {
      final result = await useCase();
      emit(AboutLoaded(result));
    } catch (e) {
      emit(AboutError(e.toString()));
    }
  }
}