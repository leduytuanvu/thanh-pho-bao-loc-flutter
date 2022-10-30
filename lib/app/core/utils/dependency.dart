// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:shop2hand/data/network/api/auth_api.dart';
// import 'package:shop2hand/data/network/dio/dio_client.dart';
// import 'package:shop2hand/data/repositories/auth_repository.dart';

// class DependencyCreator {
//   static init() {
//     Get.lazyPut(() => AuthAPI(dioClient: Get.find()));
//     Get.lazyPut(() => AuthRepository(authAPI: Get.find()));
//     Get.lazyPut(() => DioClient(Get.find()));
//     Get.lazyPut(() => Dio());
//   }
// }
