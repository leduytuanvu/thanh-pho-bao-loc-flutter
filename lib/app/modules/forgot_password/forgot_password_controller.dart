import 'dart:developer';
import '../../core/utils/export.dart';

class ForgotPasswordController extends GetxController {
  final phoneTextController = TextEditingController();
  final codeTextController = TextEditingController();
  var sentCode = false.obs;

  goToSignInScreen() {
    Get.back();
  }

  sendCode({String? phone}) async {
    sentCode(true);
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: '+84$phone',
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     if (e.code == 'invalid-phone-number') {
    //       log('The provided phone number is not valid.');
    //     }
    //   },
    //   codeSent: (String verificationId, int? resendToken) async {
    //     String smsCode = 'xxxx';
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verificationId,
    //       smsCode: smsCode,
    //     );
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
    log('checkcode');
  }

  checkCode({String? code}) async {}

  changePassword() async {}
}
