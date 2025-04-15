enum FormStatus {
  idle,
  loading,
  success,
  error;

  bool get isLoading => this == FormStatus.loading;
  bool get isSuccess => this == FormStatus.success;
  bool get isError => this == FormStatus.error;
  bool get isIdle => this == FormStatus.idle;
}
