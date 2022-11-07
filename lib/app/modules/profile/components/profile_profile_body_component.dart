import '../../../core/utils/export.dart';

class ProfileProfileBodyComponent extends StatelessWidget {
  const ProfileProfileBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Full name'),
              Spacer(),
              Text('Le Duy Tuan Vu'),
            ],
          ),
          Row(
            children: const [
              Text('Email'),
              Spacer(),
              Text('leduytuanvu.work@gmail.com'),
            ],
          ),
          Row(
            children: const [
              Text('Phone'),
              Spacer(),
              Text('0961191732'),
            ],
          ),
          Row(
            children: const [
              Text('Phone'),
              Spacer(),
              Text('0961191732'),
            ],
          ),
        ],
      ),
    );
  }
}
