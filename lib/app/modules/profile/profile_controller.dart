import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/friends_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/post_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import '../../core/utils/export.dart';

enum SignOutState {
  initial,
  loading,
}

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  ProfileController({required this.authRepository});
  var intdexTabBar = 0.obs;
  var num = 0.0.obs;
  var title = "Post".obs;
  final scrollController = ScrollController();
  var search = "".obs;
  var user = user_entity.User().obs;
  var signOutState = SignOutState.initial.obs;
  var shouldPop = false.obs;

  final PageController pageController = PageController();
  var textController = TextEditingController();

  @override
  void onInit() {
    user(LocalStorageService.getUser().data);
    super.onInit();
  }

  List<Widget> listTabBar = [
    const PostProfileBodyComponent(),
    const FriendProfileBodyComponent(),
    const ProfileProfileBodyComponent(),
  ];

  // SIGN OUT
  Future<void> signOut({BuildContext? context}) async {
    Get.back();
    signOutState(SignOutState.loading);
    await Future.delayed(const Duration(seconds: 3));
    var baseResponse = await authRepository.signOut();
    await LocalStorageService.clearAllData();
    if (baseResponse.statusAction == StatusAction.success) {
      Get.offAllNamed(Routers.signInScreen);
    } else {
      showSnackBar(
        context: context,
        message: baseResponse.message,
        color: Colors.red,
      );
    }
    signOutState(SignOutState.initial);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? searchUser({
    required String? search,
  }) {
    final usersRef = FirebaseFirestore.instance.collection("users");
    var tmp = usersRef
        .orderBy("email")
        .where("email", isGreaterThanOrEqualTo: search)
        .where("email", isLessThan: '$search' 'z');
    return tmp.snapshots();
  }
}
