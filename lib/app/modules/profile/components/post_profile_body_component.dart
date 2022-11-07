export 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanh_pho_bao_loc/app/components/post_component.dart';

import '../../../core/utils/export.dart';

class PostProfileBodyComponent extends StatelessWidget {
  const PostProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
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
