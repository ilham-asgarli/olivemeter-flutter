part of 'predict_bloc.dart';

@immutable
abstract class PredictEvent {
  const PredictEvent();
}

class StartAnalyze extends PredictEvent {}

class FinishAnalyze extends PredictEvent {
  final bool? good;
  final String? error;

  const FinishAnalyze({
    this.good,
    this.error,
  });
}
