import 'package:image_picker/image_picker.dart';
import 'package:thanh_pho_bao_loc/app/data/repositories/auth_repository.dart';
import 'package:thanh_pho_bao_loc/app/modules/create_post/screen/create_post_screen.dart';
import 'package:video_player/video_player.dart';
import '../../../core/utils/export.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class CreatePostController extends GetxController {
  final AuthRepository authRepository;
  CreatePostController({required this.authRepository});
  dynamic pickImageError;
  bool isVideo = false;
  var dropdownValue = "Public".obs;
  final List<String> list = <String>[
    'Public',
    'Private',
  ];

  VideoPlayerController? controller;
  VideoPlayerController? toBeDisposed;
  String? retrieveDataError;

  final ImagePicker picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
  }

  Future<void> playVideo(XFile? file) async {
    if (file != null) {
      // if (file != null && mounted) {
      await disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      // setState(() {});
    }
  }

  Future<void> onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (controller != null) {
      await controller!.setVolume(0.0);
    }
    if (isVideo) {
      final XFile? file = await picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await playVideo(file);
    } else if (isMultiImage) {
      await displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile> pickedFileList = await picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          // setState(() {
          //   _imageFileList = pickedFileList;
          // });
        } catch (e) {
          // setState(() {
          //   _pickImageError = e;
          // });
        }
      });
    } else {
      await displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          // setState(() {
          //   _setImageFileListFromFile(pickedFile);
          // });
        } catch (e) {
          // setState(() {
          //   _pickImageError = e;
          // });
        }
      });
    }
  }

  Future<void> disposeVideoController() async {
    if (toBeDisposed != null) {
      await toBeDisposed!.dispose();
    }
    toBeDisposed = controller;
    controller = null;
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await playVideo(response.file);
      } else {
        isVideo = false;
        // setState(() {
        //   if (response.files == null) {
        //     _setImageFileListFromFile(response.file);
        //   } else {
        //     _imageFileList = response.files;
        //   }
        // });
      }
    } else {
      retrieveDataError = response.exception!.code;
    }
  }

  Future<void> displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add optional parameters'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: maxWidthController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: 'Enter maxWidth if desired'),
              ),
              TextField(
                controller: maxHeightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: 'Enter maxHeight if desired'),
              ),
              TextField(
                controller: qualityController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: 'Enter quality if desired'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: const Text('PICK'),
                onPressed: () {
                  final double? width = maxWidthController.text.isNotEmpty
                      ? double.parse(maxWidthController.text)
                      : null;
                  final double? height = maxHeightController.text.isNotEmpty
                      ? double.parse(maxHeightController.text)
                      : null;
                  final int? quality = qualityController.text.isNotEmpty
                      ? int.parse(qualityController.text)
                      : null;
                  onPick(width, height, quality);
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
