import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<XFile?> pickImage(ImageSource source);
}
