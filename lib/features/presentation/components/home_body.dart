import 'package:expenses/core/extensions/extensions.dart';
import 'package:expenses/features/presentation/components/my_appbar.dart';
import 'package:expenses/features/presentation/components/pie_default.dart';
import 'package:expenses/features/presentation/components/top_home_row.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../core/constants/colors_manager.dart';
import '../../domin/entities/expense.dart';
import '../controllers/expenses_cubit/expenses_cubit.dart';
import 'bar_chart.dart';

class HomeBody extends StatefulWidget {
  final List<ExpenseEntity> items;

  const HomeBody({super.key, required this.items});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _currIndex = 2;
  late PageController _controller1;
  late PageController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = PageController(initialPage: _currIndex);
    _controller2 = PageController(initialPage: _currIndex);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: LiquidPullToRefresh(
        onRefresh: ()=>  ExpensesCubit.get(context).getExpensesData,
        showChildOpacityTransition: false,
        color: const Color(0xffB1DACC),
        child: ListView(
          children: [
            const TopHomeRow(),
            //const PieChart(),
            SizedBox(
              height: 320,
              width: double.infinity,
              child: PageView.builder(
                controller: _controller1,
                itemCount: widget.items.length,
                onPageChanged: (i) {
                  _controller2.jumpTo(_controller1.offset);
                  setState(() {
                    _currIndex = i;
                  });
                },
                itemBuilder: (context, index) {
                  return PieChart(expenses: widget.items[index]);
                },
              ),
            ),
            10.0.h(context),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_currIndex >= 0) {
                        _controller1.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: _currIndex == 0 ? AppColors.grey : AppColors.black,
                    ),
                  ),
                  Text(
                    widget.items[_currIndex].month,
                    style: context.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currIndex != widget.items.length - 1) {
                        _controller1.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: _currIndex == widget.items.length - 1
                          ? AppColors.grey
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _controller2,
                itemCount: widget.items.length,
                onPageChanged: (i) {
                  _controller1.jumpTo(_controller2.offset);
                  setState(() {
                    _currIndex = i;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: widget.items[_currIndex].items.map((e) {
                      return BarChart(
                        item: e,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
