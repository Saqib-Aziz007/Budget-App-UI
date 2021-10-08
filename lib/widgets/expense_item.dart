import 'package:budget_app_ui/screens/category_screen.dart';
import 'package:budget_app_ui/ui_helper/color_helper.dart';
import 'package:budget_app_ui/ui_helper/constants.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:flutter/material.dart';

import 'custom_container.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
      {Key? key, required this.totalSpentAmount, required this.category})
      : super(key: key);

  final Category category;
  final double totalSpentAmount;

  @override
  Widget build(BuildContext context) {
    final double _amountSpent = (category.maxAmount - totalSpentAmount);
    double percent = _amountSpent / category.maxAmount;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryScreen(
                percent: percent,
                category: category,
                totalAmountSpent: totalSpentAmount,
              );
            },
          ),
        );
      },
      child: CustomContainer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: kHeading2TextStyle,
                ),
                Text(
                  '\$${_amountSpent.toStringAsFixed(2)} / ${category.maxAmount.toStringAsFixed(2)}',
                  style: kHeading3TextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double _barWidth = percent * constraints.maxWidth;
                if (_amountSpent < 0) {
                  _barWidth = 0;
                }
                return Stack(
                  children: [
                    Container(
                      height: 17,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 17,
                      width: _barWidth,
                      decoration: BoxDecoration(
                        color: getColor(percent: percent, context: context),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
