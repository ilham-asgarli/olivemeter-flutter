part of 'image_bloc.dart';

@immutable
abstract class ImageState {
  final int page;

  const ImageState({required this.page});
}

class ImageInitial extends ImageState {
  const ImageInitial({required super.page});
}

class ImageLoading extends ImageState {
  const ImageLoading({required super.page});
}

class ImageAdding extends ImageSuccess {
  const ImageAdding({
    required super.imageModel,
    required super.page,
  });
}

class ImageSuccess extends ImageState {
  final ImageModel imageModel;

  const ImageSuccess({
    required this.imageModel,
    required super.page,
  });
}

class ImageError extends ImageState {
  final String error;

  const ImageError({
    required this.error,
    required super.page,
  });
}
