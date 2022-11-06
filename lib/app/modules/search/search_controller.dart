import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import '../../core/utils/export.dart';

class SearchController extends GetxController {
  // ATTRIBUTES

  // @override
  // void onInit() {
  //   searchUser();
  //   super.onInit();
  // }
  var search = "".obs;
  var showSuffixIcon = true.obs;

  final UserRepository userRepository;
  var searchKey = TextEditingController();
  // CRONTRUCTOR
  SearchController({
    required this.userRepository,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>>? searchUser({
    required String? search,
  }) {
    return FirebaseFirestore.instance
        .collection("users")
        .orderBy("fullName", descending: true)
        .where("fullName", isGreaterThanOrEqualTo: search)
        .where("fullName", isLessThan: '$search' 'z')
        // .where("fullName", isLessThan: '$search' 'z')
        .snapshots();
  }
}
