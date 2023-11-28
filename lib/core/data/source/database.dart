import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todos_app/core/data/models/todo.dart';

class AppDataBase {
  
 AppDataBase._();
static AppDataBase? _instance;

static getInstance() {
  _instance ??= AppDataBase._();
  return _instance;
}



Future<Database> _openDataBase()async{
  final database =await openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'todos.db'),
  // When the database is first created, create a table to store Todos.
  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, day_id TEXT ,title TEXT,desc TEXT ,date TEXT,  done INTEGER)',
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 2,
);
return database;
}




// A method that retrieves all the todos from the Todos table.
Future<int> addTodo(Todo todo) async {
  // Get a reference to the database.
  final db = await _openDataBase();
return
 db.insert("Todo", todo.toMap());

}
// A method that retrieves all the todos from the Todos table.
Future<List<Todo>> getTodos(String dayId) async {
  // Get a reference to the database.
  final db = await _openDataBase();

  // Query the table for all The Todos.
  final List<Map<String, dynamic>> maps = await db.query('Todo', 
  whereArgs: ["day_id" , "=" ,dayId ]
  );

  // Convert the List<Map<String, dynamic> into a List<Todo>.
  return List.generate(maps.length, (i) {
    return Todo(
      id: maps[i]['id'] as int,
      dayId: maps[i]['day_id'],
      title: maps[i]['title'] as String,
      desc: maps[i]['desc'] as String,
      date: maps[i]['date'] as String,
      done: maps[i]['done'] as int,


    );
  });
}

Future<void> updateTodo(Todo todo) async {
  // Get a reference to the database.
  final db = await _openDataBase();

  // Update the given Todo.
  await db.update(
    'Todo',
    todo.toMap(),
    // Ensure that the Todo has a matching id.
    where: 'id = ?',
    // Pass the Todo's id as a whereArg to prevent SQL injection.
    whereArgs: [todo.id],
  );
}

Future<void> deleteTodo(int id) async {
  // Get a reference to the database.
  final db = await _openDataBase();

  // Remove the Todo from the database.
  await db.delete(
    'Todo',
    // Use a `where` clause to delete a specific todo.
    where: 'id = ?',
    // Pass the Todos's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}






}