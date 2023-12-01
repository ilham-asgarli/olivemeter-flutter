import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/helpers/image-picker/image_picker_helper.dart';
import '../components/history.dart';
import '../components/photos.dart';
import '../view-model/main_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: context.paddingNormal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Fotoğraflar",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  XFile? file = await ImagePickerHelper.instance
                                      .pickImage(source: ImageSource.gallery);

                                  if (context.mounted && file != null) {
                                    BlocProvider.of<MainCubit>(context)
                                        .showAnalyzer(
                                      context,
                                      xFile: file,
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.camera,
                                ),
                              ),
                              15.horizontalSpace,
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  XFile? file = await ImagePickerHelper.instance
                                      .pickImage();

                                  if (context.mounted && file != null) {
                                    BlocProvider.of<MainCubit>(context)
                                        .showAnalyzer(
                                      context,
                                      xFile: file,
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.camera_alt_rounded,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Photos(),
                    Padding(
                      padding: context.paddingNormal,
                      child: const Text(
                        "Önceki tahminler",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const History(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
