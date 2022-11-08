import 'package:thanh_pho_bao_loc/app/components/list_discover_component.dart';
import 'package:thanh_pho_bao_loc/app/components/post_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/home_controller.dart';
import '../../core/utils/export.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        // SearchHeaderComponent(),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'Discover',
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 14.h),
        const ListDiscoverComponent(),
        SizedBox(height: 15.h),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo1'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo2'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo3'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo4'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
        const PostComponent(image: 'demo5'),
        const Divider(
          color: Colors.black12,
          thickness: 10,
        ),
      ],
    );
  }
}
