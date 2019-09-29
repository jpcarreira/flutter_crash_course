import "dart:core";

class Endpoint {
  static String apiScheme = "https";
  static String apiHost = "fluttercrashcourse.com";
  static String prefix = "/api/v1";

  static Uri uri(String path, {Map<String, dynamic> queryParameters}) {
    return Uri(
        scheme: apiScheme,
        host: apiHost,
        path: '$prefix$path',
        queryParameters: queryParameters);
  }
}
