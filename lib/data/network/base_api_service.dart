abstract class BaseApiSevices {
  Future<dynamic> getApiResponse(String url);

  Future<dynamic> postApiResponse(String url, dynamic data);
}
