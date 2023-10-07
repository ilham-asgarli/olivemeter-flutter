import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

import '../view-model/main_cubit.dart';

class GalleryImageItem extends StatefulWidget {
  final AssetEntity assetEntity;

  const GalleryImageItem({
    super.key,
    required this.assetEntity,
  });

  @override
  State<GalleryImageItem> createState() => _GalleryImageItemState();
}

class _GalleryImageItemState extends State<GalleryImageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: () async {
        BlocProvider.of<MainCubit>(context).showAnalyzer(
          context,
          assetEntity: widget.assetEntity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetEntityImageProvider(
              widget.assetEntity,
              thumbnailSize: const ThumbnailSize.square(200),
              isOriginal: false,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
