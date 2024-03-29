import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/binding/splash_binding.dart';
import 'package:thanh_pho_bao_loc/app/routes/pages.dart';
import 'app/core/utils/export.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  // DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  runApp(const ThanhPhoBaoLoc());
}

class ThanhPhoBaoLoc extends StatelessWidget {
  const ThanhPhoBaoLoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.upToDown,
          transitionDuration: const Duration(milliseconds: 300),
          debugShowCheckedModeBanner: false,
          initialRoute: Routers.splashScreen,
          initialBinding: SplashBinding(),
          getPages: Pages.allPage,
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        );
      },
    );
  }
}

initServices() async {
  log('STARTING SERVICES ...');
  await Get.putAsync(() => LocalStorageService.init());
  log('ALL SERVICE STARTED ...');
}

