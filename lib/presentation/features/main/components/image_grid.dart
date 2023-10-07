import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olive_quality/core/extensions/context_extension.dart';
import 'package:olive_quality/utils/logic/models/image_model.dart';
import 'package:olive_quality/utils/logic/state/image/image_bloc.dart';

import 'gallery_image_item.dart';

class ImageGrid extends StatefulWidget {
  final ImageModel imageModel;

  const ImageGrid({
    super.key,
    required this.imageModel,
  });

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  final ScrollController _scrollController = ScrollController();
  bool add = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    /* double scrollPercentage = (_scrollController.position.pixels /
            _scrollController.position.maxScrollExtent) *
        100;

    if (scrollPercentage > 50 && add) {
      add = false;
      await context.read<ImageBloc>().addImages();
    } else {
      add = true;
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      addAutomaticKeepAlives: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: context.paddingNormalHorizontal,
      itemCount: widget.imageModel.entities.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        print(index);
        print(((widget.imageModel.entities.length - 1) * 0.5).toInt());
        if (index == ((widget.imageModel.entities.length - 1) * 0.5).toInt()) {
          context.read<ImageBloc>().addImages();
          print("Add");
        }

        return GalleryImageItem(
          assetEntity: widget.imageModel.entities[index],
        );
      },
    );
  }
}
