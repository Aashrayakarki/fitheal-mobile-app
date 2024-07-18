class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  static const String ipAddress = "192.168.1.4:5000";
  static const String baseUrl = "http://$ipAddress/api/";
  static const String imageUrl = "http://$ipAddress/products/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/register";
  static const String currentUser = "user/getMe";
  static const String uploadImage = "user/uploadVideo";
  static const String forgotPassword = "user/forgot_password";

  // ====================== Exercise Routes ======================
  static const String createExercise = "exercise/create";
  static const String getAllExercises = "exercise/pagination_exercise";
  static const String deleteExercise = "exercise/";

  // ====================== Meal Routes ======================
  static const String createMeal = "meal/create";
  static const String getAllMeals = "meal/pagination_meal";
  static const String deleteMeal = "meal/";

  static const limitPage = 4;

  // static const String paginationExercise = "exercise/pagination";
}
