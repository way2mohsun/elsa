import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expense;

  BarChart({this.expense});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expense.forEach((element) {
      if (mostExpensive < element) {
        mostExpensive = element;
      }
    });

    return Column(
      children: [
        Text(
          'Weekly Spending',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Text(
              'Nov 10, 2019 - Nov 20, 2019',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                size: 30,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Bar(
              label: 'Su',
              amountSpend: expense[0],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Mo',
              amountSpend: expense[1],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Tu',
              amountSpend: expense[2],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'We',
              amountSpend: expense[3],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Th',
              amountSpend: expense[4],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Fr',
              amountSpend: expense[5],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'St',
              amountSpend: expense[6],
              mostExpensive: mostExpensive,
            ),
          ],
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double mostExpensive;
  final double _maxBarHeight = 100;

  Bar({this.label, this.amountSpend, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpend / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpend.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
