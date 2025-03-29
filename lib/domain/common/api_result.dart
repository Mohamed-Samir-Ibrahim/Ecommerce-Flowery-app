sealed class ApiResult <T>{
}

class Success<T>extends ApiResult<T>{
  T ?data;
  Success(this.data);
}
class Error<T>extends ApiResult<T>{
  Exception ?exception;
  Error(this.exception);
}

// class Loading<T>extends Result<T>{

//   Loading();
// }