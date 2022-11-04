import 'package:get/get.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';

class SearchController extends GetxController {
  // ATTRIBUTES
  // final AuthRepository authRepository;
  final UserRepository userRepository;

  // CRONTRUCTOR
  SearchController({
    // required this.authRepository,
    required this.userRepository,
  });
}
