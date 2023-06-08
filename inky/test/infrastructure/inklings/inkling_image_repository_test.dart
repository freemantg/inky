import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inky/infrastructure/inklings/inkling_image_picker.dart';
import 'package:inky/infrastructure/inklings/inklings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inkling_image_repository_test.mocks.dart';

@GenerateMocks([InklingImagePicker])
void main() {
  group(
    'InklingImageRepository',
    () {
      late MockInklingImagePicker mockImagePicker;
      late InklingImageRepository repository;

      setUp(() {
        mockImagePicker = MockInklingImagePicker();
        repository = InklingImageRepository(imagePicker: mockImagePicker);
      });

      test('pickImage from gallery', () async {
        final XFile mockFile = XFile('/mock/path');
        when(mockImagePicker.pickImage(ImageSource.gallery))
            .thenAnswer((_) async => mockFile);

        final result = await repository.pickImage(isCameraSource: false);

        verify(mockImagePicker.pickImage(ImageSource.gallery)).called(1);
        expect(result, mockFile.path);
      });

      test('pickImage from camera', () async {
        final XFile mockFile = XFile('/mock/path');
        when(mockImagePicker.pickImage(ImageSource.camera))
            .thenAnswer((_) async => mockFile);

        final result = await repository.pickImage(isCameraSource: true);

        verify(mockImagePicker.pickImage(ImageSource.camera)).called(1);
        expect(result, mockFile.path);
      });

      test('pickImage returns null when no image is picked', () async {
        when(mockImagePicker.pickImage(any)).thenAnswer((_) async => null);

        final result = await repository.pickImage(isCameraSource: true);

        verify(mockImagePicker.pickImage(any)).called(1);
        expect(result, null);
      });
    },
  );
}
