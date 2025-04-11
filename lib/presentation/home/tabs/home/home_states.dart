
import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/home_model/categories/categories_model.dart';
import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/domain/entity/home_entity/category.dart';
enum Status { loading, success, error ,}

class HomeStates extends Equatable{
  Status status;
  HomeModel? home;

  Exception? exception;
  String? loadingMessage;

  HomeStates(
      {required this.status,
        this.exception,
        this.loadingMessage,
        this.home
   });

  HomeStates copyWith({
    Status? status,
    Exception? exception,
    HomeModel? home,

    String? loadingMessage,
  }) {
    return HomeStates(
        status: status ?? this.status,
home: home??this.home,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,exception,loadingMessage,home];

}
