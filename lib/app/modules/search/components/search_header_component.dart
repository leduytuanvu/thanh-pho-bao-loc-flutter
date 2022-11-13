import 'package:lottie/lottie.dart';
import 'package:thanh_pho_bao_loc/app/modules/search/controller/search_controller.dart';

import '../../../core/utils/export.dart';

class SearchHeaderComponent extends GetWidget<SearchController> {
  const SearchHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Expanded(
            child: Obx(
              () => TextField(
                onTap: (() => controller.showSuffixIcon(true)),
                onChanged: ((value) {
                  controller.search(value);
                }),
                autofocus: false,
                controller: controller.searchKey,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search by email",
                  hintStyle: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: Colors.black26,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 11.w),
                    child: Lottie.asset(
                      'assets/videos/search1.json',
                      height: 19.w,
                      width: 19.w,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.showSuffixIcon(false);
                    },
                    child: controller.search.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.searchKey.clear();
                              controller.search("");
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.black54,
                              size: 21.sp,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                cursorColor: Colors.black12,
                cursorWidth: 0.6.w,
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  color: Colors.black87,
                  fontSize: 16.sp,
                ),
                // cursorHeight: ,
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
