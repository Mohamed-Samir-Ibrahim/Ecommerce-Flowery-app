sealed class ApiResult<T> {
  const ApiResult();
}

// ✅ Success Case
class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

// ❌ Failure Case
class Failure extends ApiResult<Never> {
  final String message;
  const Failure(this.message);
}
