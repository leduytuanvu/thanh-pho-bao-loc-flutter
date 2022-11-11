import 'package:thanh_pho_bao_loc/app/modules/create_post/controller/create_post_controller.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/components/header_post_component.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/components/post_content_component.dart';

import '../../../core/utils/export.dart';

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class CreatePostScreen extends GetWidget<CreatePostController> {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: Text(
          "Create new post",
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 18.sp,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 12.w, bottom: 12.w, right: 10.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4.r),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.buttonRadient1,
                    // AppColors.buttonRadient2,
                    AppColors.buttonRadient3,
                  ],
                ),
              ),
              width: 60,
              child: const Center(
                child: Text(
                  "POST",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              const HeaderPostComponent(),
              SizedBox(height: 18.h),
              const PostContentComponent(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
