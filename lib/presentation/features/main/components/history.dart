import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olive_quality/core/extensions/context_extension.dart';
import 'package:olive_quality/core/extensions/num_extension.dart';

import '../../../../utils/logic/state/history/history_bloc.dart';
import 'history_item.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistorySuccess) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              right: context.normalValue,
              left: context.normalValue,
              bottom: context.normalValue,
            ),
            itemCount: state.historyModels.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HistoryItem(
                historyModel: state.historyModels[index],
              );
            },
            separatorBuilder: (context, index) {
              return 10.verticalSpace;
            },
          );
        } else if (state is HistoryInitial) {
          return SizedBox(
            height: context.height * 0.3,
            child: const Center(
              child: Text(
                "Tahmin geçmişi yok...",
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
