import 'package:equatable/equatable.dart';
import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';

enum ChangePasswordStatus { initial, loading, success, error }

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final ChangePasswordEntity? entity;
  final Exception? exception;

  const ChangePasswordState({
    required this.status,
    this.entity,
    this.exception,
  });

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    ChangePasswordEntity? entity,
    Exception? exception,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      entity: entity ?? this.entity,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, entity, exception];
}