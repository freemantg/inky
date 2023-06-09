import 'package:image_picker/image_picker.dart';

import 'inkling_image_picker.dart';

class InklingImageRepository {
  final InklingImagePicker _imagePicker;

  InklingImageRepository({required InklingImagePicker imagePicker})
      : _imagePicker = imagePicker;

  Future<String?> pickImage({bool isCameraSource = false}) async {
    final XFile? image = await _imagePicker.pickImage(
      isCameraSource ? ImageSource.camera : ImageSource.gallery,
    );
    if (image == null) return null;
    return image.path;
  }
}
