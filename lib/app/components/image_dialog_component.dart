import '../core/utils/export.dart';

class ImageDialogComponent extends StatelessWidget {
  final String url;
  final String path;
  const ImageDialogComponent({
    super.key,
    this.url = "",
    this.path = "",
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: url.isEmpty
              ? DecorationImage(
                  image: ExactAssetImage(path),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
