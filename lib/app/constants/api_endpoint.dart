class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://192.168.1.3:5000/api/";
  // static const String baseUrl = "http://10.12.17.71:5000/api/";

  // static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/register";
  static const String currentUser = "user/getMe";
  static const String uploadImage = "user/uploadVideo";

  // ====================== Exercise Routes ======================
  static const String createExercise = "exercise/create";
  static const String getAllExercises = "exercise/pagination";
  static const String deleteExercise = "exercise/";
  // static const String paginationExercise = "exercise/pagination";
}
