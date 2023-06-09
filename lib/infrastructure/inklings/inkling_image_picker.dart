import 'package:image_picker/image_picker.dart';
import 'package:inky/domain/inklings/image_picker_service.dart';

class InklingImagePicker implements ImagePickerService {
  final ImagePicker _picker;

  InklingImagePicker(this._picker);

  @override
  Future<XFile?> pickImage(ImageSource source) {
    return _picker.pickImage(source: source);
  }
}
