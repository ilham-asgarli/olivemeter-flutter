part of 'predict_bloc.dart';

@immutable
abstract class PredictState {
  const PredictState();
}

class PredictInitial extends PredictState {}

class Analyzing extends PredictState {}

class PredictSuccess extends PredictState {
  final bool good;

  const PredictSuccess({
    required this.good,
  });
}

class PredictError extends PredictState {
  final String error;

  const PredictError({
    required this.error,
  });
}
