import 'package:flutter/material.dart';
import 'package:olive_quality/core/extensions/context_extension.dart';

import '../../../widgets/my_shimmer.dart';

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return MyShimmer(
      color: Colors.blue,
      child: GridView.builder(
        padding: context.paddingNormalHorizontal,
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
