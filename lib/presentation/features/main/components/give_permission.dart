import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olive_quality/core/extensions/num_extension.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../utils/logic/state/image/image_bloc.dart';

class GivePermission extends StatefulWidget {
  const GivePermission({super.key});

  @override
  State<GivePermission> createState() => _GivePermissionState();
}

class _GivePermissionState extends State<GivePermission> {
  bool refreshVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Fotoğraflarınızı görüntüleyebilmemiz için erişim izni verin.",
          ),
          10.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await PhotoManager.openSetting();
                  setState(() {
                    refreshVisibility = true;
                  });
                },
                child: const Text(
                  "İzin ver",
                ),
              ),
              20.horizontalSpace,
              Visibility(
                visible: refreshVisibility,
                child: ElevatedButton(
                  onPressed: () async {
                    await context.read<ImageBloc>().getImages();
                    setState(() {
                      refreshVisibility = false;
                    });
                  },
                  child: const Text(
                    "Yenile",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
