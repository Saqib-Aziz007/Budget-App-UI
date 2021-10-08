import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/widgets/bar_chart.dart';
import 'package:budget_app_ui/widgets/custom_container.dart';
import 'package:budget_app_ui/widgets/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            floating: true,
            pinned: true,
            forceElevated: true,
            expandedHeight: 100,
            leading: IconButton(
              iconSize: 30.0,
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Simple Budget',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            actions: [
              IconButton(
                iconSize: 30.0,
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return CustomContainer(
                    child: BarChart(expenses: weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  for (var element in category.expenses) {
                    totalAmountSpent += element.cost;
                  }
                  return ExpenseItem(
                    category: category,
                    totalSpentAmount: totalAmountSpent,
                  );
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
