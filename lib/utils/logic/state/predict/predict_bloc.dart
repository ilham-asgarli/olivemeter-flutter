import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:meta/meta.dart';

part 'predict_event.dart';
part 'predict_state.dart';

class PredictBloc extends Bloc<PredictEvent, PredictState> {
  PredictBloc() : super(PredictInitial()) {
    on<StartAnalyze>(onStartAnalyze);
    on<FinishAnalyze>(onFinishAnalyze);
  }

  Future<void> startAnalyze(String image) async {
    try {
      add(StartAnalyze());
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('predict');
      final res = await callable.call<Map<String, dynamic>>({
        "image": image,
      });

      var quality = res.data["quality"];
      print(quality);

      bool good = quality > 0.5;
      add(FinishAnalyze(good: good));
    } catch (e) {
      add(FinishAnalyze(error: e.toString()));
    }
  }

  void onStartAnalyze(StartAnalyze event, Emitter<PredictState> emit) {
    emit(Analyzing());
  }

  void onFinishAnalyze(FinishAnalyze event, Emitter<PredictState> emit) {
    if (event.error != null) {
      emit(PredictError(error: event.error!));
    } else {
      emit(PredictSuccess(good: event.good!));
    }
  }
}
