import 'package:budget_app_ui/ui_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BarChart extends StatelessWidget {
  const BarChart({Key? key, required this.expenses}) : super(key: key);

  final List expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var element in expenses) {
      if (element > mostExpensive) {
        mostExpensive = element;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            'Weekly Spending',
            style: kHeading1TextStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              const Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: kHeading2TextStyle,
              ),
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bar(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Mo',
                  amountSpent: expenses[1],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Tu',
                  amountSpent: expenses[2],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'We',
                  amountSpent: expenses[3],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Th',
                  amountSpent: expenses[4],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Fr',
                  amountSpent: expenses[5],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Sa',
                  amountSpent: expenses[6],
                  mostExpensive: mostExpensive),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar(
      {Key? key,
      required this.label,
      required this.amountSpent,
      required this.mostExpensive})
      : super(key: key);

  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
