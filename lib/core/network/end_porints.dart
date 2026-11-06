class EndPoints {
  static String apiKey = "35d67e2d98f94491a3bff0d301df9786";
  static String baseUrl = "https://newsapi.org/v2";
  static String topHeadlines = "/top-headlines";
  static String everything = "/everything";
  static const List<String> categories = [
    'general',
    'business',
    'technology',
    'sports',
    'health',
    'science',
    'entertainment',
  ];

  static const int pageSize = 20;
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}

class Apikey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "";
}
