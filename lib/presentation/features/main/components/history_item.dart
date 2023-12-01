import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/extensions/date_time_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/models/history_model.dart';

class HistoryItem extends StatelessWidget {
  final HistoryModel historyModel;

  const HistoryItem({
    super.key,
    required this.historyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: historyModel.good ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
              image: DecorationImage(
                image: FileImage(
                  File(historyModel.tempPath),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            historyModel.good ? "Kaliteli" : "Kalitesiz",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    historyModel.createdAt.ddMMyyyy.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    historyModel.createdAt.Hm.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              15.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
