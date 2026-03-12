import 'dart:io';

import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ImagePickerHelper {
  static Future<File?> pickImageFromCamera({bool crop = true}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      return crop
          ? await _cropImage(File(pickedFile.path))
          : File(pickedFile.path);
    }
    return null;
  }

  static Future<File?> pickImageFromGallery({bool crop = true}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return crop
          ? await _cropImage(File(pickedFile.path))
          : File(pickedFile.path);
    }
    return null;
  }

  static Future<File?> _cropImage(File file) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: ColorConstant.primaryColor,
          toolbarWidgetColor: ColorConstant.whiteColor,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );

    return cropped != null ? File(cropped.path) : null;
  }

  Future<File> urlToFile(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    final bytes = response.bodyBytes;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/image.jpg');

    await file.writeAsBytes(bytes);

    return file;
  }
}
