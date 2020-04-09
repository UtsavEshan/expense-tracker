import 'package:flutter/material.dart';
import 'package:expensetracker/expensescreen.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/data.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      child: MaterialApp(
        home: ExpenseScreen(),
      ),
    );
  }
}

