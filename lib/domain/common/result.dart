sealed class Result <T>{
}

class Success<T>extends Result<T>{
  T ?data;
  Success(this.data);
}
class Errorr<T>extends Result<T>{
  Exception ?exception;
  Errorr(this.exception);
}
// class Loading<T>extends Result<T>{
//
//   Loading();
// }