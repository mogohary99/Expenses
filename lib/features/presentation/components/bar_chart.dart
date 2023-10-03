import 'dart:async';

import 'package:expenses/core/extensions/extensions.dart';
import 'package:expenses/core/extensions/icons_extensions.dart';
import 'package:expenses/core/extensions/num_extension.dart';
import 'package:expenses/features/domin/entities/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metooltip/metooltip.dart';

class BarChart extends StatefulWidget {
  final ExpenseItemEntity item;

  const BarChart({
    super.key,
    required this.item,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  double fulSize = 0;
  double secondsToComplete = 5.0;

  @override
  void initState() {
    super.initState();
    double percentage = widget.item.percentage / 100;
    timer = Timer.periodic(const Duration(milliseconds: 1200 ~/ 60), (timer) {
      setState(() {
        fulSize += percentage / (secondsToComplete * 1200 ~/ 60);
        if (fulSize >= percentage) {
          fulSize = percentage;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(1) - 20,
      height: 65,
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      child: CustomPaint(
        size: Size(context.width(1) - 20, 80),
        painter: BarChartPainter(
          fullSize: fulSize,
          color: widget.item.color.withOpacity(0.4),
        ),
        child: BarChartTile(
          expense: widget.item,
        ),
      ),
    );
  }
}

class BarChartTile extends StatelessWidget {
  const BarChartTile({
    super.key,
    required this.expense,
  });

  final ExpenseItemEntity expense;

  @override
  Widget build(BuildContext context) {
    return MeTooltip(
      message: expense.title,
      decoration: BoxDecoration(
        color: expense.color.withOpacity(0.7)
      ),
     // triangleColor: expense.color,
      child: Container(
        width: context.width(1) - 20,
        height: 80,
        padding: const EdgeInsets.only(left: 14),
        child: ListTile(
          leading: SvgPicture.asset(
            expense.title.toIcon,
            width: 25,
            height: 25,
            color: expense.color,
          ),
          title: Text(
            expense.title,
            style: context.bodyMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              '${expense.numOfTransaction} Transaction',
              style: context.bodySmall!.copyWith(
                fontSize: 14,
                color: const Color(0xff919295),
              ),
            ),
          ),
          trailing: MeTooltip(
            message: '\$${expense.price.toFormat}',
            decoration: BoxDecoration(
                color: expense.color.withOpacity(0.7)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${expense.price.toFormat}',
                  style: context.bodyMedium,
                ),
                Text(
                  '${expense.percentage}%',
                  style: context.bodySmall!.copyWith(
                    fontSize: 12,
                    color: const Color(0xff919295),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final Color color;
  final double fullSize;

  BarChartPainter({
    required this.fullSize,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      const Offset(10, 0) & Size((size.width - 10) * fullSize, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
