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


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int initMounth = 1;
int initYear = 1952;
int firstYear = 1952;
int lastYear = 2100;
int numberOfYear = lastYear - firstYear;
int numberOfMounth = numberOfYear * 12;
PageController controller = PageController();

List<Widget> listWidget() {
  List<Widget> list = [];
  int tmp = 0;
  int day = 0;
  for (int i = 0; i < numberOfMounth; i++) {
    tmp++;
    if (tmp == 13) {
      tmp = 1;
    }
    switch (i) {
      case 1:
        day = 31;
        break;
      case 2:
        day = 28;
        break;
      case 3:
        day = 31;
        break;
      case 4:
        day = 30;
        break;
      case 5:
        day = 31;
        break;
      case 6:
        day = 30;
        break;
      case 7:
        day = 31;
        break;
      case 8:
        day = 31;
        break;
      case 9:
        day = 30;
        break;
      case 10:
        day = 31;
        break;
      case 11:
        day = 30;
        break;
      case 12:
        day = 31;
        break;
    }
    list.add(
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Text(
          'Mounth ${i + 1} Year ${firstYear + i ~/ 12}',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        // child: Row(),
      ),
    );
  }
  return list;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // controller = PageController(
    //   initialPage:
    //       numberOfMounth - (lastYear - initYear) * 12 - (12 - initMounth),
    // );
  }

  @override
  Widget build(BuildContext context) {
    bool pinned = true;
    bool snap = false;
    bool floating = false;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            titleSpacing: 0,
            elevation: 0,
            pinned: pinned,
            snap: snap,
            floating: floating,
            expandedHeight: 104.0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color(0xFF173366),
                    Color(0xFF5872A7),
                    Color(0xFFA5B8Ec),
                  ],
                ),
              ),
              child: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Thêm tiện ích',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                ),
              ),
            ),
            leading: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -1, 0),
                      height: size.height * 0.52,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xFF173366),
                            Color(0xFF5872A7),
                            Color(0xFFA5B8Ec),
                          ],
                        ),
                        border: Border(
                          bottom: BorderSide.none,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    setState(() {
                                      if (initYear == firstYear &&
                                          initMounth == 1) {
                                      } else {
                                        initMounth--;
                                        if (initMounth < 1) {
                                          initMounth = 12;
                                          initYear--;
                                        }
                                      }

                                      // controller.animateToPage(
                                      //   initMounth +
                                      //       (initYear - firstYear) *
                                      //           numberOfMounth,
                                      //   duration:
                                      //       const Duration(milliseconds: 300),
                                      //   curve: Curves.easeInOut,
                                      // );
                                    });
                                  }),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.transparent,
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Tháng $initMounth - $initYear",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: (() {
                                    setState(() {
                                      if (initYear == lastYear &&
                                          initMounth == 12) {
                                      } else {
                                        initMounth++;
                                        if (initMounth > 12) {
                                          initMounth = 1;
                                          initYear++;
                                        }
                                      }

                                      // controller.animateToPage(
                                      //   initMounth +
                                      //       (initYear - firstYear) *
                                      //           numberOfMounth,
                                      //   duration:
                                      //       const Duration(milliseconds: 300),
                                      //   curve: Curves.easeInOut,
                                      // );
                                    });
                                  }),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.transparent,
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Text(
                                    "CN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T4",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T5",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T6",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "T7",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.34,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[
                                  Color(0xFF173366),
                                  Color(0xFF5872A7),
                                  Color(0xFFA5B8Ec),
                                ],
                              ),
                              border: Border(
                                bottom: BorderSide.none,
                              ),
                            ),
                            child: PageView(
                              /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                              /// Use [Axis.vertical] to scroll vertically.

                              onPageChanged: (int index) {
                                // log(index.toString());
                                setState(() {
                                  initMounth = index % 12 + 1;
                                  initYear = index ~/ 12 + firstYear;
                                  log(initMounth.toString());
                                  log(initYear.toString());
                                });
                              },
                              controller: controller,
                              children: <Widget>[...listWidget()],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: Image.asset(
                              "assets/icons/up.png",
                              height: 14,
                              width: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Tiện ích",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 34,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.circle, color: Colors.blue),
                          Text(
                            "BBQ Group",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Thay đổi",
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Color(0xFF505E8C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Khung giờ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 34,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Không có khung giờ trống...",
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Mô tả",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 34,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập nội dung",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 15.5,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Text(
                            "Thông tin",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 37,
                        vertical: 34,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Căn hộ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Căn hộ x2-23",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF1C3767),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Text(
                                "Họ tên",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Pr04u",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF1C3767),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "pro4u@local.com.vn",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF1C3767),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Text(
                                "Số điện thoại",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "84907488454",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF1C3767),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 12),
                      child: Row(
                        children: [
                          const Text(
                            "Chính sách và quy tắc đặt tiện ích",
                            style: TextStyle(
                                fontSize: 15.6,
                                color: Color(0xFF505E8C),
                                fontStyle: FontStyle.italic),
                          ),
                          const Spacer(),
                          const Text(
                            "Đồng ý",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.3,
                            ),
                          ),
                          SizedBox(
                            height: 29,
                            width: 29,
                            // color: Colors.red,
                            child: Checkbox(
                              value: false,
                              onChanged: null,
                              fillColor: MaterialStateProperty.all(
                                const Color(0xFF1C3767),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 42),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAD7DB),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1.6),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Gửi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                );
                initMounth++;
                if (initMounth > 12) {
                  initMounth = 1;
                  initYear++;
                }
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:vuldt_task_calendar/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      title: 'vuldt_task_calendar',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'USA'),
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

