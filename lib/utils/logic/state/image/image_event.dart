part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {
  const ImageEvent();
}

class GetImages extends ImageEvent {
  const GetImages();
}

class FinishImages extends ImageEvent {
  final ImageModel? imageModel;
  final String? error;

  const FinishImages({
    this.imageModel,
    this.error,
  });
}

class AddImages extends ImageEvent {
  final ImageModel imageModel;

  const AddImages({
    required this.imageModel,
  });
}
