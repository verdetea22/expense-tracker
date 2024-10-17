import 'package:uuid/uuid.dart';

const uuid = Uuid(); //utility, doesnt belong to class

//custom value, seen as text
enum Category{food, travel, leisure, work}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //random unique id
// initalizer lists can initalize class properties that arent received as constructor func arg (id)

  final String id; //want to create dynamically (uuid)  , not required input
  final String title;
  final double amount;
  final DateTime date;
  final Category category; 
}