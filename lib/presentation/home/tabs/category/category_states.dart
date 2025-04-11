

// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flowery/domain/entity/Categotries_entity/category_model.dart';

enum CategoryStatus { initial,loading, success, error ,}

class CategoryStates extends Equatable{
  CategoryStatus status;
  List<Categories_entity>? Obj_categories;
  Exception? exception;
  String? loadingMessage;

  CategoryStates(
      {required this.status,
        this.exception,
        this.loadingMessage,
        this.Obj_categories,}); 

  CategoryStates copyWith({
    CategoryStatus? status,
    List<Categories_entity>? Obj_categories,
    Exception? exception,
    String? loadingMessage,
  }) {
    return CategoryStates(
        status: status ?? this.status,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception,
        Obj_categories:Obj_categories?? this.Obj_categories ,);
  }

  @override
  List<Object?> get props => [status,Obj_categories,exception,loadingMessage,];
}
