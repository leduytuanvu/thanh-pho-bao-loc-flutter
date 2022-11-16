import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
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

enum UpdateProfileState {
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
  var title = "POST (12)".obs;
  var search = "".obs;
  var user = user_entity.User().obs;

  var signOutState = SignOutState.initial.obs;
  var updateProfileState = UpdateProfileState.initial.obs;
  var shouldPop = false.obs;

  var fullName = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var birthday = "".obs;
  var birthdayTmp = "".obs;
  var genderTmp = "Choose gender".obs;
  var gender = "Choose gender".obs;
  DateTime selectedDate = DateTime.now();

  final List<String> listEmpty = <String>[
    "Choose gender",
    "Male",
    "Female",
    "Other"
  ];
  final List<String> list = <String>["Male", "Female", "Other"];
  // var dropdownValue = "Choose gender".obs;

  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  var textController = TextEditingController();

  //
  final fullNameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final emailTextController = TextEditingController();

  late final ScrollController scrollController;
  final PageController pageController = PageController();

  final ImagePicker picker = ImagePicker();
  File? imageFile;

  List<Widget> listTabBar = [
    const PostProfileBodyComponent(),
    const FriendProfileBodyComponent(),
    const ProfileProfileBodyComponent(),
  ];

  @override
  void onInit() {
    user(LocalStorageService.getUser().data);

    fullNameTextController.text = user.value.fullName!;
    emailTextController.text = user.value.email!;
    phoneTextController.text = user.value.phone!;

    fullName(user.value.fullName!);
    email(user.value.email!);
    phone(user.value.phone!);

    if (user.value.gender != Gender.empty) {
      gender(user.value.gender.toString());
    }
    // selectedDate = DateTime.parse(user.value.birthday!);

    birthday(formatter.format(user.value.birthday!));
    birthdayTmp(formatter.format(user.value.birthday!));

    log("${user.value.gender} Gender cua user");
    switch (user.value.gender) {
      case Gender.empty:
        gender("");
        genderTmp("Choose gender");
        break;
      case Gender.female:
        gender("Female");
        genderTmp("Female");
        break;
      case Gender.male:
        gender("Male");
        genderTmp("Male");
        break;
      case Gender.other:
        gender("Other");
        genderTmp("Other");
        break;
      case null:
        break;
    }
    log("$gender GENDER");
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    scrollController.dispose();
    pageController.dispose();
  }

  Future updateUser({required String title}) async {
    updateProfileState(UpdateProfileState.loading);
    try {
      switch (title) {
        case "Email":
          user.value.email = emailTextController.text;
          break;
        case "Full name":
          user.value.fullName = fullNameTextController.text;
          break;
        case "Phone":
          user.value.phone = phoneTextController.text;
          break;
        case "Birthday":
          log("${user.value.birthday} user birthday");
          log("${birthday.value} birthday value");
          log("${birthdayTmp.value} birthday tmp value");
          // DateTime tmp = DateTime.parse(birthday.value);
          // log("$tmp 222222222222222");
          DateTime formatDate;
          formatDate = DateFormat("yyyy-MM-dd").parse(
            birthdayTmp.value,
          );
          log("$formatDate 111111111111111111111111111111dateTimeBirthday");
          user.value.birthday = formatDate;
          log("${user.value.birthday} 111111111111111111111111111111dateTimeBirthday");
          break;
        case "Gender":
          log("${genderTmp.value} Gender TMP");
          log("${gender.value} Gender");
          switch (genderTmp.value) {
            case "female":
            case "Female":
              user.value.gender = Gender.female;
              break;
            case "male":
            case "Male":
              user.value.gender = Gender.male;
              break;
            case "other":
            case "Other":
              user.value.gender = Gender.other;
              break;
            case "Choose gender":
              user.value.gender = Gender.empty;
              break;
          }
          break;
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.value.id)
          .update(user.value.toJson());
      LocalStorageService.setUser(user.value);
      updateProfileState(UpdateProfileState.initial);
      switch (title) {
        case "Email":
          email(emailTextController.text);
          break;
        case "Full name":
          fullName(fullNameTextController.text);
          break;
        case "Phone":
          phone(phoneTextController.text);
          break;
        case "Birthday":
          final DateFormat formatter = DateFormat('dd-MM-yyyy');
          birthday(formatter.format(user.value.birthday!));
          // birthday(user.value.birthday!.toIso8601String());
          // log("${birthday.value} HEHEHEHEEH");
          break;
        case "Gender":
          gender(genderTmp.value);
          break;
      }
    } catch (e) {
      log("$e IN UPDATE USER");
    }
  }

  // SIGN OUT
  Future<void> signOut({BuildContext? context}) async {
    Get.back();
    signOutState(SignOutState.loading);
    await Future.delayed(const Duration(seconds: 1));
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

  Future getImagePictureFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      Get.back();
      updateProfileState(UpdateProfileState.loading);
      await uploadImageFile();
      log(imageFile.toString());
    } else {
      log('No image selected.');
    }
    updateProfileState(UpdateProfileState.initial);
  }

  Future getImagePictureFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
      Get.back();
      updateProfileState(UpdateProfileState.loading);

      await uploadImageFile();
      log(imageFile.toString());
    } else {
      log('No image selected.');
    }
    updateProfileState(UpdateProfileState.initial);
  }

  Future getWallpaperPictureFromGallery() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      Get.back();
      updateProfileState(UpdateProfileState.loading);
      await uploadWallpaperFile();
      log(imageFile.toString());
    } else {
      log('No image selected.');
    }
    updateProfileState(UpdateProfileState.initial);
  }

  Future getWallpaperPictureFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image.path);
      Get.back();
      updateProfileState(UpdateProfileState.loading);

      await uploadWallpaperFile();
      log(imageFile.toString());
    } else {
      log('No image selected.');
    }
    updateProfileState(UpdateProfileState.initial);
  }

  Future uploadImageFile() async {
    if (imageFile == null) return;
    final fileName = basename(imageFile!.path);
    var destination = 'images/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(imageFile!);
      var link = await ref.getDownloadURL();

      user_entity.User userEntity = LocalStorageService.getUser().data;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEntity.id)
          .update({'image': link});
      userEntity.image = link;
      LocalStorageService.setUser(userEntity);
      user(userEntity);
    } catch (e) {
      log("SOME THING WRONG");
    }
  }

  Future uploadWallpaperFile() async {
    if (imageFile == null) return;
    final fileName = basename(imageFile!.path);
    var destination = 'images/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(imageFile!);
      var link = await ref.getDownloadURL();

      user_entity.User userEntity = LocalStorageService.getUser().data;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEntity.id)
          .update({'wallpaper': link});
      userEntity.wallpaper = link;
      LocalStorageService.setUser(userEntity);
      user(userEntity);
    } catch (e) {
      log("SOME THING WRONG");
    }
  }
}
