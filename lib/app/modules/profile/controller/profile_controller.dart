import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:thanh_pho_bao_loc/app/core/config/app_enums.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/friends_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/post_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/profile/components/profile_profile_body_component.dart';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import '../../../core/utils/export.dart';

enum SignOutState {
  initial,
  loading,
}

class ProfileController extends GetxController {
  final AuthRepository authRepository;
  ProfileController({required this.authRepository});

  // Index of tabbar in profile screen
  var intdexTabBar = 0.obs;
  // Width of tabbar positioned animation
  var num = 0.0.obs;
  var title = "POST".obs;
  var search = "".obs;
  var user = user_entity.User().obs;
  var signOutState = SignOutState.initial.obs;
  var shouldPop = false.obs;
  var birthday = "".obs;
  var gender = "Choose gender".obs;

  final List<String> list = <String>[
    'Choose gender',
    'Male',
    'Female',
    'Other'
  ];
  var dropdownValue = "Choose gender".obs;

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  var textController = TextEditingController();
  late final ScrollController scrollController;
  final PageController pageController = PageController();

  List<Widget> listTabBar = [
    const PostProfileBodyComponent(),
    const FriendProfileBodyComponent(),
    const ProfileProfileBodyComponent(),
  ];

  @override
  void onReady() {
    // scrollController.addListener(() {
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     log("Scrolling down");
    //   } else {
    //     log("Scrolling up");
    //   }
    //   log("Scrolling up");
    // });
    super.onInit();
  }

  @override
  void onInit() {
    log("init");
    scrollController = ScrollController()
      ..addListener(() {
        log("Scrolling up");
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          log("Scrolling down");
        } else {
          log("Scrolling up");
        }
      });
    user(LocalStorageService.getUser().data);
    birthday(formatter.format(user.value.birthday!));
    switch (user.value.gender) {
      case Gender.empty:
        gender("");
        break;
      case Gender.femail:
        gender("Female");
        break;
      case Gender.male:
        gender("Male");
        break;
      case Gender.other:
        gender("Other");
        break;
      case null:
        break;
    }
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    scrollController.dispose();
    pageController.dispose();
  }

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
