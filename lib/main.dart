import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 87, 143, 70));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme:  kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16, 
            vertical: 8
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal, 
            color: kColorScheme.onSecondaryContainer, 
            fontSize: 14,
          ),
        )
      ),
      home: const Expenses(),
    ),
  );
}
