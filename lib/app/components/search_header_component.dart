import '../core/utils/export.dart';

class SearchHeaderComponent extends StatelessWidget {
  const SearchHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        color: Colors.green,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100.0.r),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    left: 10.w,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.search,
                        color: Colors.black26,
                        size: 22.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'Search by name, email, phone number ...',
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            color: Colors.black26,
                            fontSize: 15.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(
                  100.r,
                ),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class SearchHeaderComponent extends StatelessWidget {

//     return Padding(
//       padding: EdgeInsets.only(left: 10.w, right: 10.w),
//       child: Container(
//         color: Colors.green,
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: 40.w,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(100.0.r),
//                 ),
//                 alignment: Alignment.center,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     right: 10.w,
//                     left: 10.w,
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(width: 2.w),
//                       Icon(
//                         Icons.search,
//                         color: Colors.black26,
//                         size: 22.sp,
//                       ),
//                       SizedBox(width: 8.w),
//                       Expanded(
//                         child: Text(
//                           'Search by name, email, phone number ...',
//                           style: TextStyle(
//                             fontFamily: GoogleFonts.montserrat().fontFamily,
//                             color: Colors.black26,
//                             fontSize: 15.sp,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 5.w),
//             Container(
//               width: 40.w,
//               height: 40.w,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(
//                   100.r,
//                 ),
//               ),
//               child: const Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
// }
