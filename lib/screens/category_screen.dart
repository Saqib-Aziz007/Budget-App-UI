import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/ui_helper/color_helper.dart';
import 'package:budget_app_ui/ui_helper/constants.dart';
import 'package:budget_app_ui/widgets/custom_container.dart';
import 'package:budget_app_ui/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key? key,
    required this.category,
    required this.percent,
    required this.totalAmountSpent,
  }) : super(key: key);

  final Category category;
  final double percent;
  final double totalAmountSpent;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Widget _buildItemList() {
    List<Widget> expenseList = [];
    for (var expense in widget.category.expenses) {
      expenseList.add(
        CustomContainer(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expense.name,
                style: kHeading2TextStyle,
              ),
              Text(
                '\$${(expense.cost).toStringAsFixed(2)}',
                style: kHeading2TextStyleWithColor,
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              height: 250,
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  baLineColor: Colors.grey[200],
                  frLineColor: getColor(
                    context: context,
                    percent: widget.percent,
                  ),
                  percent: widget.percent,
                  width: 15.0,
                ),
                child: Center(
                  child: Text(
                    '\$${(widget.totalAmountSpent).toStringAsFixed(2)} / ${widget.category.maxAmount}',
                    style: kHeading2TextStyle,
                  ),
                ),
              ),
            ),
            _buildItemList(),
          ],
        ),
      ),
    );
  }
}
