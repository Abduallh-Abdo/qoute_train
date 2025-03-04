abstract class ApiConsumer {
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
}
