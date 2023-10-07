part of 'history_bloc.dart';

@immutable
abstract class HistoryState {
  const HistoryState();
}

class HistoryInitial extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<HistoryModel> historyModels;

  const HistorySuccess({
    required this.historyModels,
  });
}

class HistoryError extends HistoryState {
  final String error;

  const HistoryError({
    required this.error,
  });
}
