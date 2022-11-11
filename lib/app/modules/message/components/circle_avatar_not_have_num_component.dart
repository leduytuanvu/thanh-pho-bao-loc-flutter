import '../../../core/utils/export.dart';

class CircleAvatarNotHaveNumComponent extends StatelessWidget {
  const CircleAvatarNotHaveNumComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: Image.asset(
        'assets/images/demo1.png',
        fit: BoxFit.cover,
        height: 64.w,
        width: 64.w,
      ),
    );
  }
}
