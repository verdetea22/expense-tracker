import 'dart:ffi';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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

//user interactable forum
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true, //ensures keyboard doesnt block fields
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense (Expense expense) {
    setState(() {
      _reigsteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _reigsteredExpenses.indexOf(expense);
    setState(() {
      _reigsteredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //removes old message if new message is prompted before duration ends
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _reigsteredExpenses.insert(expenseIndex, expense);
            });
          }
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if(_reigsteredExpenses.isNotEmpty){
      mainContent = Expanded(
            child: ExpensesList(expenses: _reigsteredExpenses, onRemoveExpense: _removeExpense,));
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('M\'s Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600 ? Column(// col within a col, need to define dim
        // Toolbar with the add button => Row()
        children: [
          Chart(expenses: _reigsteredExpenses),
          Expanded(
            child: mainContent
          )
        ],
      )
    : Row(children: [
          Expanded(
            child: Chart(expenses: _reigsteredExpenses),
          ),
          Expanded(
            child: mainContent
          ),
        ]),
    );
  }
}