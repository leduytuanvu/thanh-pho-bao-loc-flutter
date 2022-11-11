class DependencyCreator {
  static init() {
    // Get.lazyPut(() => AuthAPI(dioClient: Get.find()));
    // Get.lazyPut(() => AuthRepository(authAPI: Get.find()));
    // Get.lazyPut(() => DioClient(Get.find()));
    // Get.lazyPut(() => Dio());
    // Get.put(() => HomeController(authRepository: Get.find()));
  }
}
