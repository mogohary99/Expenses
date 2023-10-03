import 'dart:async';
import 'dart:math';

import 'package:expenses/core/constants/strings_manager.dart';
import 'package:expenses/core/extensions/extensions.dart';
import 'package:expenses/core/extensions/num_extension.dart';
import 'package:expenses/features/domin/entities/expense.dart';
import 'package:expenses/features/domin/entities/expense_item.dart';
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  final ExpenseEntity expenses;

  const PieChart({super.key, required this.expenses});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  double fulAngle = 0;
  double secondsToComplete = 5.0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      setState(() {
        fulAngle += 360.0 / (secondsToComplete * 1000 ~/ 60);
        if (fulAngle >= 360.0) {
          fulAngle = 360.0;
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
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomPaint(
        painter: CircleChartPainter(
          items: widget.expenses.items,
          fullAngle: fulAngle,
        ),
        child: Container(
          width: 180,
          height: 180,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
               AppStrings.totalSpent,
                style: context.bodySmall!.copyWith(fontSize: 18),
              ),
              // SizedBox(height: 5),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  '\$${widget.expenses.totalPrice.toFormat}',
                  style: context.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleChartPainter extends CustomPainter {
  final List<ExpenseItemEntity> items;
  final double fullAngle;

  CircleChartPainter({
    required this.items,
    required this.fullAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..strokeWidth = 5.00
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    final center = Offset(size.width / 2.0, size.height / 2.0);
    double radius = size.width * 0.8;
    final rect = Rect.fromCircle(center: center, radius: radius);
    var startAngle = 0.00;
    for (var e in items) {
      double sweepAngle = drawSectors(e, canvas, rect, startAngle);

      final ponasAngle = (e.percentage / 100) * fullAngle * pi / 180.0;
      final whiteAngle = ponasAngle - sweepAngle;
      startAngle += sweepAngle;
      if (e != items[items.length - 1]) {
        canvas.drawArc(rect, startAngle + 0.05, whiteAngle, false, linePaint);
        startAngle += whiteAngle;
      }
    }
  }

  double drawSectors(
      ExpenseItemEntity e, Canvas canvas, Rect rect, double startAngle) {
    final sweepAngle = ((e.percentage / 100) * fullAngle * pi / 180.0) - 0.1;
    Paint paint = Paint()
      ..strokeWidth = 8.00
      ..color = e.color.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    return sweepAngle;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
