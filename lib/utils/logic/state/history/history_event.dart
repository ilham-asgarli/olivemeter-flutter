part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {
  const HistoryEvent();
}

class GetHistory extends HistoryEvent {
  const GetHistory();
}

class AddToHistory extends HistoryEvent {
  final CreateHistoryModel createHistoryModel;

  const AddToHistory({
    required this.createHistoryModel,
  });
}
