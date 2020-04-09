import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/data.dart';

//Pop up Screen to add Expense window
class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final priceController = TextEditingController();
  final reasonController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    priceController.dispose();
    reasonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String reason;
    String price;



    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Expense',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 30,),
            TextField(
                autofocus: true,
                controller: priceController,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration:InputDecoration(hintText: 'Amount',),
                textAlign: TextAlign.center
            ),
            SizedBox(height: 30,),
            TextField(
              decoration:InputDecoration(hintText: 'Description',),
              textAlign: TextAlign.center,
              controller: reasonController,
            ),
            SizedBox(height: 40,),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
               price = '\$${priceController.text}';
               reason = reasonController.text;
                Provider.of<ExpenseData>(context, listen: false).addExpense(reason, price);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}



//Each Expense is an Item
class Item extends StatelessWidget {
  const Item({this.price,this.reason});

  final String price;
  final String reason;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(horizontal:5, vertical: 10),
          title: Text(
            '$price',
            style: TextStyle(color: Colors.green, fontSize: 23.0),
          ),
          subtitle: Text(
            '$reason',
            style: TextStyle(color: Colors.green, fontSize: 15.0),
          ),
          trailing:Text(
            '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
            style: TextStyle(color: Colors.green, fontSize: 15.0),),
        ),
        decoration: BoxDecoration(border:Border(bottom: BorderSide(color:Colors.black)),)
    );
  }
}



//An the list of these Items is the ExpenseList
class ExpensesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final expense = taskData.expenses[index];
            return Item(
              price: expense.price,
              reason: expense.reason,
            );
          },
          itemCount: taskData.expenseCount,
        );
      },
    );
}
}
