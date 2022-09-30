import 'package:image_picker/image_picker.dart';

class InklingImageRepository {
  final ImagePicker _imagePicker;

  InklingImageRepository({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  Future<String?> pickImage({required bool isCameraSource}) async {
    final XFile? image = await _imagePicker.pickImage(
      source: isCameraSource ? ImageSource.camera : ImageSource.gallery,
    );
    if (image == null) return null;
    return image.path;
  }
}
