class ApiRoutes {
  static const String baseUrl = 'https://api-live.ucan.fitness/api';

  static String login = '$baseUrl/account/login';

  static String workout=
      '$baseUrl/categories/search?CategoryTypeId=1';

  static String workoutExercises(String workoutId) =>
      '$baseUrl/categories/search?CategoryTypeId=1&ParentCategoryId=$workoutId';

  static String exerciseDetails(String exercisesId) =>
      '$baseUrl/portal/products/$exercisesId';

  static String workoutLogo(String logoPath) =>
      '$baseUrl/${logoPath.substring(3)}';
}
