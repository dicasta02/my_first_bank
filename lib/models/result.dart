enum Status {
  success,
  loading,
  error,
}

class Result<T> {
  Status status;
  T data;
  Map<String, String> errors;

  Result.loading(this.data) {
    status = Status.loading;
  }

  Result.success(this.data) {
    status = Status.success;
  }

  Result.error({
    String message,
    int code = 0,
  }) {
    status = Status.error;
    errors = {};
  }

  Result.errors(this.errors) {
    status = Status.error;
  }
}
