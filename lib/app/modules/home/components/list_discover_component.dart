import 'package:thanh_pho_bao_loc/app/modules/home/components/add_discover_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/home/components/discover_item_component.dart';
import '../../../core/utils/export.dart';

class ListDiscoverComponent extends StatelessWidget {
  const ListDiscoverComponent({super.key});

  List<Widget> getList() {
    List<String> listImage = [
      "assets/images/demo1.png",
      "assets/images/demo2.png",
      "assets/images/demo3.png",
      "assets/images/demo4.png",
      "assets/images/demo5.png",
      "assets/images/demo1.png",
      "assets/images/demo2.png",
      "assets/images/demo3.png",
      "assets/images/demo4.png",
      "assets/images/demo5.png",
    ];
    List<Widget> list = [];
    for (int i = 0; i < listImage.length; i++) {
      if (i == 0) {
        list.add(const AddDiscoverComponent());
      } else if (i == listImage.length - 1) {
        list.add(DiscoverItemComponent(image: listImage[i], isEnd: true));
      } else {
        list.add(DiscoverItemComponent(image: listImage[i]));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (scrollController) {
              return false;
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                ...getList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
