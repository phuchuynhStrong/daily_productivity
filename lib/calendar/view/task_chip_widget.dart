import 'package:daily_productivity/styles.dart';
import 'package:flutter/material.dart';

class TaskChipWidget extends StatelessWidget {
  const TaskChipWidget({Key? key, required this.title, this.onDeleted})
      : super(key: key);

  final String title;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      deleteIcon: const Icon(
        Icons.close,
        size: IconSizes.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Corners.radiusVal),
      ),
      onDeleted: () {
        onDeleted?.call();
      },
      padding: EdgeInsets.all(Insets.med),
    );
  }
}
