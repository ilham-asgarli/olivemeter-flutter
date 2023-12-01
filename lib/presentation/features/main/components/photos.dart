import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../utils/logic/state/image/image_bloc.dart';
import 'give_permission.dart';
import 'image_grid.dart';
import 'image_loading.dart';

class Photos extends StatelessWidget {
  const Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.6,
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageSuccess) {
            return ImageGrid(imageModel: state.imageModel);
          } else if (state is ImageLoading) {
            return const ImageShimmer();
          } else if (state is ImageError) {
            return const GivePermission();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
