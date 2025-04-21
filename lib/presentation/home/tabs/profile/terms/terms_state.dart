import 'package:equatable/equatable.dart';
import 'package:flowery/domain/entity/Profile_entity/terms_entity.dart';

abstract class TermsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TermsInitial extends TermsState {}

class TermsLoading extends TermsState {}

class TermsLoaded extends TermsState {
  final List<TermsEntity> terms;

  TermsLoaded(this.terms);

  @override
  List<Object?> get props => [terms];
}

class TermsError extends TermsState {
  final String message;

  TermsError(this.message);

  @override
  List<Object?> get props => [message];
}
