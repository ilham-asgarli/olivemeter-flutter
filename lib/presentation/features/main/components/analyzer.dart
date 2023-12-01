import 'dart:convert';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/models/create_history_model.dart';
import '../../../../utils/logic/state/history/history_bloc.dart';
import '../../../../utils/logic/state/predict/predict_bloc.dart';

class Analyzer extends StatelessWidget {
  final AssetEntity? assetEntity;
  final XFile? xFile;

  const Analyzer({
    super.key,
    this.assetEntity,
    this.xFile,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PredictBloc(),
      child: Container(
        padding: context.paddingNormal,
        height: context.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.height * 0.2,
              height: context.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: assetEntity != null
                      ? AssetEntityImageProvider(
                          assetEntity!,
                        )
                      : FileImage(
                          File(xFile!.path),
                        ) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            50.verticalSpace,
            BlocBuilder<PredictBloc, PredictState>(
              buildWhen: (previous, current) {
                return previous is! PredictSuccess;
              },
              builder: (context, state) {
                print(state);

                if (state is PredictInitial) {
                  start(context);

                  return Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Fotoğraf dönüştürülüyor...",
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is PredictSuccess) {
                  save(context, state.good);

                  return RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      text: "Analiz tamamlandı: ",
                      children: [
                        TextSpan(
                          style: TextStyle(
                            color: state.good ? Colors.green : Colors.red,
                          ),
                          text: state.good
                              ? "High quality / Kaliteli"
                              : "Low quality / Kalitesiz",
                        ),
                      ],
                    ),
                  );
                } else if (state is Analyzing) {
                  return Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Fotoğraf analiz ediliyor...",
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is PredictError) {
                  print(state.error);

                  return const Text(
                    "Hata, lütfen tekrar deneyin.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  void start(BuildContext context) async {
    List<int> imageBytes =
        (await assetEntity?.originBytes) ?? (await xFile?.readAsBytes()) ?? [];
    var base64 = base64Encode(imageBytes);
    print(base64.length);

    if (context.mounted) {
      context.read<PredictBloc>().startAnalyze(base64);
    }
  }

  void save(BuildContext context, bool good) async {
    BlocProvider.of<HistoryBloc>(context).add(AddToHistory(
      createHistoryModel: CreateHistoryModel(
        name: (await assetEntity?.titleAsync) ?? xFile?.name ?? "",
        bytes: (await assetEntity?.originBytes) ?? (await xFile?.readAsBytes()),
        good: good,
      ),
    ));
  }
}
