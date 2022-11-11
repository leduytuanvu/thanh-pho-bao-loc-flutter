import 'package:thanh_pho_bao_loc/app/data/repositories/user_repository.dart';
import '../../../core/utils/export.dart';

class SearchController extends GetxController {
  // ATTRIBUTES

  @override
  void onInit() {
    super.onInit();
    showSuffixIcon = true.obs;
  }

  var search = "".obs;
  var showSuffixIcon = true.obs;

  final UserRepository userRepository;
  var searchKey = TextEditingController();
  // CRONTRUCTOR
  SearchController({
    required this.userRepository,
  });

  @override
  void dispose() {
    super.dispose();
    searchKey.dispose();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? searchUser({
    required String? search,
  }) {
    // return FirebaseFirestore.instance
    //     .collection("users")
    //     .orderBy("fullName", descending: true)
    //     .where("fullName", isGreaterThanOrEqualTo: search)
    //     .where("fullName", isLessThan: '$search' 'z')
    //     // .where("fullName", isLessThan: '$search' 'z')
    //     .snapshots();
    final usersRef = FirebaseFirestore.instance.collection("users");
    // var tmp1 = usersRef
    //     .orderBy("fullName", descending: true)
    //     .where("fullName", isGreaterThanOrEqualTo: search)
    //     .where("fullName", isLessThan: '$search' 'z');
    // log(tmp1.snapshots().first.toString());
    // var tmp2 = tmp1
    //     // .orderBy("phone", descending: true)
    // .where("phone", isEqualTo: search);

    var tmp = usersRef
        .orderBy("email")
        .where("email", isGreaterThanOrEqualTo: search)
        .where("email", isLessThan: '$search' 'z');
    // var tmp1 = tmp
    //     .where("fullName", isGreaterThanOrEqualTo: search)
    //     .where("fullName", isLessThan: '$search' 'z');
    // log(usersRef.snapshots().length.toString());
    return tmp.snapshots();
  }
}
