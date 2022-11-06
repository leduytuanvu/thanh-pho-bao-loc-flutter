import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:thanh_pho_bao_loc/app/modules/splash/splash_binding.dart';
import 'package:thanh_pho_bao_loc/app/routes/pages.dart';
import 'app/core/utils/export.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
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
          debugShowCheckedModeBanner: false,
          initialRoute: Routers.splashScreen,
          initialBinding: SplashBinding(),
          getPages: Pages.allPage,
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
