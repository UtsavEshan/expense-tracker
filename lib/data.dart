import 'package:expensetracker/Components.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseData extends ChangeNotifier {


  List<Item> _expenseList = [
    Item(price:'23',reason:'Krispy Kreme'),
    Item(price: '34',reason: 'French Fries',),
    Item(price: '150',reason: 'Buy back my soul from The devil',),
  ];

  UnmodifiableListView<Item> get expenses {
    return UnmodifiableListView(_expenseList);
  }


  int get expenseCount {
    return _expenseList.length;
  }


  void addExpense(String reason, String price) {
    final item =  Item(price:price, reason:reason);
    _expenseList.add(item);
    notifyListeners();
  }

  void deleteExpense(Item item) {
    _expenseList.remove(item);
    notifyListeners();
  }

}
