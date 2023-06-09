import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inky/infrastructure/inklings/inkling_image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inkling_image_picker_test.mocks.dart';

@GenerateMocks([ImagePicker])
void main() {
  group(
    'InklingImagePicker',
    () {
      late MockImagePicker mockImagePicker;
      late InklingImagePicker inklingImagePicker;

      setUp(
        () {
          mockImagePicker = MockImagePicker();
          inklingImagePicker = InklingImagePicker(mockImagePicker);
        },
      );
      test(
        'pickImage',
        () async {
          final XFile mockFile = XFile('mockPath');
          when(mockImagePicker.pickImage(source: ImageSource.gallery))
              .thenAnswer((_) async => mockFile);

          final result =
              await inklingImagePicker.pickImage(ImageSource.gallery);
          verify(mockImagePicker.pickImage(source: ImageSource.gallery))
              .called(1);
          expect(result, mockFile);
        },
      );
    },
  );
}
