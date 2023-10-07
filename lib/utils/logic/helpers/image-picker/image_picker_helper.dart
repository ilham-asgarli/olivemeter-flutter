import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePickerHelper instance = ImagePickerHelper._init();

  ImagePickerHelper._init();

  final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.camera,
  }) async {
    final XFile? photo = await picker.pickImage(source: source);

    return photo;
  }
}
