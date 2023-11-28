import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todos_app/core/data/models/todo.dart';
import 'package:todos_app/core/data/source/database.dart';
import 'package:todos_app/core/utils/formats.dart';
import 'package:todos_app/core/utils/sizes.dart';

class TodoController extends ChangeNotifier {

  List<Todo>  todos  =[]; 
  AppDataBase appDataBase = AppDataBase.getInstance();

  getTodos()async{
    try {
    var result =await  appDataBase.getTodos(getTodoId());
    todos = result;
    }finally{

      notifyListeners();
    }
  }
  

addTodo(BuildContext context ,String title , String details ){


  try {
    var todo = Todo(
 dayId:getTodoId(),
  
  title: title ,
   desc:details,
    done :0,
    date: getTodoId(),
    );

appDataBase.addTodo(todo);


 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('saved'.tr() ,  
        
        style: TextStyle(
          color: Colors.white , 

          fontSize: isTablet(context)? 24: 18
        ),
        ),
        backgroundColor: Colors.green,
        // duration: const Duration(seconds: 1),
      
      ));

//refresh
getTodos();
Navigator.of(context).pop();



  }finally{
    notifyListeners();
  }
}


markTodoAsComplete(BuildContext context ,Todo todo ){


  try {
    
debugPrint(todo.toMap().toString());
appDataBase.updateTodo(todo);


 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('updated'.tr() ,  
        
        style: TextStyle(
          color: Colors.white , 

          fontSize: isTablet(context)? 24: 18
        ),
        ),
        backgroundColor: Colors.green,
        // duration: const Duration(seconds: 1),
      
      ));

//refresh
getTodos();
// Navigator.of(context).pop();



  }finally{
    notifyListeners();
  }
}



update2(BuildContext context ,Todo todo ){


  try {
    
debugPrint(todo.toMap().toString());
appDataBase.updateTodo(todo);


 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('updated'.tr() ,  
        
        style: TextStyle(
          color: Colors.white , 

          fontSize: isTablet(context)? 24: 18
        ),
        ),
        backgroundColor: Colors.green,
        // duration: const Duration(seconds: 1),
      
      ));

//refresh
getTodos();
Navigator.of(context).pop();



  }finally{
    notifyListeners();
  }
}




delete(BuildContext context ,Todo todo ){


  try {
    
debugPrint(todo.toMap().toString());
appDataBase.deleteTodo(todo.id!);


 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:  Text('deleted'.tr() ,  
        
        style: TextStyle(
          color: Colors.white , 

          fontSize: isTablet(context)? 24: 18
        ),
        ),
        backgroundColor: Colors.red,
        // duration: const Duration(seconds: 1),
      
      ));

//refresh
getTodos();
Navigator.of(context).pop();



  }finally{
    notifyListeners();
  }
}

}