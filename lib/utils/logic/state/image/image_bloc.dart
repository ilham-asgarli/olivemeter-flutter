import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:olive_quality/utils/logic/helpers/photo-manager/photo_manager_helper.dart';
import 'package:olive_quality/utils/logic/models/image_model.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(const ImageInitial(page: 0)) {
    on<GetImages>(onGetImages);
    on<FinishImages>(onFinishImages);
    on<AddImages>(onAddImages);

    getImages();
  }

  Future<void> getImages() async {
    add(const GetImages());
    addImage();
  }

  Future<void> addImages() async {
    if (state is! ImageAdding) {
      if (state is ImageSuccess) {
        add(AddImages(imageModel: (state as ImageSuccess).imageModel));
      }
      await addImage();
    }
  }

  Future<void> addImage() async {
    int page = 0;
    int pageCount = 15;

    if (state is ImageSuccess) {
      page = (state as ImageSuccess).imageModel.page + 1;
    }

    try {
      ImageModel? imageModel = await PhotoManagerHelper.instance.getImages(
        page: page,
        pageCount: pageCount,
      );

      if (imageModel != null) {
        if (state is ImageSuccess) {
          add(FinishImages(
            imageModel: ImageModel(
              pageCount: imageModel.pageCount,
              page: imageModel.page,
              entities: [
                ...(state as ImageSuccess).imageModel.entities,
                ...imageModel.entities,
              ],
              totalCount: imageModel.totalCount,
            ),
          ));
        } else {
          add(FinishImages(imageModel: imageModel));
        }
      } else {
        add(const FinishImages(error: "Permission not granted"));
      }
    } catch (e) {
      add(FinishImages(error: e.toString()));
    }
  }

  void onGetImages(GetImages event, Emitter<ImageState> emit) {
    emit(ImageLoading(page: state.page));
  }

  void onAddImages(AddImages event, Emitter<ImageState> emit) {
    emit(ImageAdding(
      imageModel: event.imageModel,
      page: event.imageModel.page,
    ));
  }

  void onFinishImages(FinishImages event, Emitter<ImageState> emit) {
    if (event.error != null) {
      emit(ImageError(error: event.error!, page: state.page));
    } else {
      emit(ImageSuccess(
        imageModel: event.imageModel!,
        page: event.imageModel!.page,
      ));
    }
  }
}
