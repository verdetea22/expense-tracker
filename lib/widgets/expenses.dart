import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _reigsteredExpenses = [
    Expense(
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work,
    ),
    Expense(
      title: 'Scary Movie', 
      amount: 21.99, 
      date: DateTime.now(), 
      category: Category.leisure,
    ),
    Expense(
      title: 'Gas', 
      amount: 32.30, 
      date: DateTime.now(), 
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add))
        ],
      ),
      body: Column(// col within a col, need to define dim
        // Toolbar with the add button => Row()
        children: [
          const Text('the chart'),
          Expanded(
            child: ExpensesList(expenses: _reigsteredExpenses)
          )
        ],
      ),
    );
  }
}