import 'package:flutter/material.dart';
import 'package:expensetracker/Components.dart';


class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddExpenseScreen(),
                  )
              )
          );
        },
      ),

      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.green[100],
                    radius: 35.0,
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 50,
                    )),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Expense',
                  style: TextStyle(fontSize: 48),
                ),
              ],
            ),
          ),



      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: ExpensesList(),
            ),
          ),
        ]),
      ),
    );
  }
}
