sealed class ApiResult <T>{
}

class Success<T>extends ApiResult<T>{
  T ?data;
  Success(this.data);
}
class Failure<T>extends ApiResult<T>{
  Exception ?exception;
  Failure(this.exception);
}
// class Loading<T>extends Result<T>{
//
//   Loading();
// }