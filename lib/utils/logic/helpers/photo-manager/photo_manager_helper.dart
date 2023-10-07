import 'package:olive_quality/utils/logic/models/image_model.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoManagerHelper {
  static final PhotoManagerHelper instance = PhotoManagerHelper._init();

  PhotoManagerHelper._init();

  Future<ImageModel?> getImages({int page = 0, int pageCount = 15}) async {
    var result = await PhotoManager.requestPermissionExtend();

    if (result.isAuth) {
      final int count = await PhotoManager.getAssetCount(
        type: RequestType.image,
      );

      print("Image count: $count");

      //PhotoManager.setLog();

      final List<AssetEntity> entities = await PhotoManager.getAssetListPaged(
        page: page,
        pageCount: pageCount,
        type: RequestType.image,
      );

      return ImageModel(
        entities: entities,
        totalCount: count,
        page: page,
        pageCount: pageCount,
      );
    }

    return null;
  }
}
