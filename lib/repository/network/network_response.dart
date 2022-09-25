enum Status { success, error, loading, timeout, internetError }

class NetworkResponse {
  final Status status;
  final String? message;
  final Map<String, dynamic>? data;

  NetworkResponse({required this.status, this.message, this.data});

  static NetworkResponse success(data) {
    return NetworkResponse(status: Status.success, data: data, message: null);
  }

  static NetworkResponse error({data, String? message}) {
    return NetworkResponse(status: Status.error, data: data, message: message);
  }
}
