import '../../core/utils/export.dart';

class BottomBarController extends GetxController {
  var index = 0.obs;

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  // final AuthRepository authRepository;
  // BottomBarController({required this.authRepository});
  // signOut({BuildContext? context}) {
  //   try {
  //     authRepository.signOut(context: context!);
  //   } catch (e) {}
  // }
}
