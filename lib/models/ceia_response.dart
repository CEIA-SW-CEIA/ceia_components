enum StatusCode { success, error }

class CEIAResponse<T> {
  final StatusCode statusCode;
  final T? data;
  final String message;

  CEIAResponse.success({this.data, this.message = 'Não informado...'}) : statusCode = StatusCode.success;

  CEIAResponse.error({this.data, required this.message}) : statusCode = StatusCode.error;

  bool get isSuccess => statusCode == StatusCode.success;

  bool get isError => statusCode == StatusCode.error;
}
