
import 'package:expenses/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class TopHomeRow extends StatelessWidget {
  const TopHomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
        left: 30,
        top: 20,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Week',
            style: context.bodySmall,
          ),
          Text(
            'Month',
            style: context.bodyMedium,
          ),
          Text(
            'Year',
            style: context.bodySmall,
          ),
        ],
      ),
    );
  }
}

