import 'package:thanh_pho_bao_loc/app/components/bottom_icon_button_component.dart';
import '../core/utils/export.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        // borderRadius: BorderRadius.circular(100.0.r),
      ),
      height: 55.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomIconBottomComponent(
            index: 0,
            image: 'house_solid.svg',
            lable: 'Home',
          ),
          BottomIconBottomComponent(
            index: 1,
            image: 'search_solid.svg',
            lable: 'Search',
          ),
          BottomIconBottomComponent(
            index: 2,
            image: 'plus.svg',
            lable: 'Post',
          ),
          BottomIconBottomComponent(
            index: 3,
            image: 'cart_shopping_solid.svg',
            lable: 'Order',
          ),
          BottomIconBottomComponent(
            index: 4,
            image: 'user_solid.svg',
            lable: 'Profile',
          ),
        ],
      ),
    );
  }
}
