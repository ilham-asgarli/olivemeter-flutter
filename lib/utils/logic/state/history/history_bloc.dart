import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:olive_quality/utils/logic/models/create_history_model.dart';
import 'package:olive_quality/utils/logic/models/history_model.dart';
import 'package:path_provider/path_provider.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends HydratedBloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<AddToHistory>(onAddToHistory);
  }

  void onAddToHistory(AddToHistory event, Emitter<HistoryState> emit) async {
    try {
      final Directory temp = await getTemporaryDirectory();
      final File imageFile =
          File('${temp.path}/images/${event.createHistoryModel.name}');

      File createdFile = await imageFile.create(recursive: true);
      File file = await createdFile.writeAsBytes(
        event.createHistoryModel.bytes?.toList() ?? [],
      );

      if (state is HistorySuccess) {
        emit(HistorySuccess(
          historyModels: [
            ...(state as HistorySuccess).historyModels,
            HistoryModel(
              name: event.createHistoryModel.name,
              tempPath: file.path,
              good: event.createHistoryModel.good,
              createdAt: DateTime.now(),
            ),
          ],
        ));
      } else {
        emit(HistorySuccess(
          historyModels: [
            HistoryModel(
              name: event.createHistoryModel.name,
              tempPath: file.path,
              good: event.createHistoryModel.good,
              createdAt: DateTime.now(),
            ),
          ],
        ));
      }
    } catch (e) {
      print(e.toString());
      emit(HistoryError(error: e.toString()));
    }
  }

  @override
  HistoryState? fromJson(Map<String, dynamic> json) {
    return HistorySuccess(
      historyModels: (json["models"] as List)
          .map((e) => HistoryModel.fromJson(e))
          .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(HistoryState state) {
    if (state is HistorySuccess) {
      return {
        "models": state.historyModels.map((e) => e.toJson()).toList(),
      };
    }

    return null;
  }
}
