import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/app/edit_todo/view/edit_todo_page.dart';
import 'package:todos_app/app/todos/view/widgets/check_box.dart';
import 'package:todos_app/core/controllers/todo_controller.dart';
import 'package:todos_app/core/data/models/todo.dart';
import 'package:todos_app/core/utils/sizes.dart';

class TodoContainer extends StatelessWidget {
  final Todo? todo;
  const TodoContainer({super.key,  this.todo});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoController>(context);

    return GestureDetector(
      onTap: (){
        Navigator.of(context )
        .push(
          
          MaterialPageRoute(builder: (_)=>   EditodoPage(
            todo: todo,
          )   
          
          )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
      padding:  EdgeInsets.all(
        isTablet(context)?
        20:
        10),
      margin: EdgeInsets.symmetric(
        vertical: 8  , horizontal:      isTablet(context)?
        20:
        10
      ),
      
        decoration: const BoxDecoration(
      
          border: Border(
            bottom: BorderSide(
      color: Color(0xff90b4ce) , 
      
            width: 1
            ),
            
          )
        ),
      
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [   
       CheckBoxCircle(
        isDone: todo!.done==1, 
        onChange: (done){
         try {
            var t = todo!.copyWith();
          
          if (done) {
          t.done=0;

          }else {
           t.done=1;
           debugPrint(t.done.toString());
          }

provider.markTodoAsComplete(context, t);
         } catch (e) {
           debugPrint(e.toString());
         }
        },
      ), 
      const SizedBox(width: 20,) ,  
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [  
        Text(
            todo!.title!,
        maxLines: 1, 
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
        fontSize: isTablet(context)?30:20,
        fontWeight: FontWeight.w400,
        )
        ), const SizedBox(height: 8,) ,  
        Text(
            todo!. desc!,
        maxLines: isTablet(context)?4:2, 
        style:  TextStyle(
        fontSize:isTablet(context)?20: 16,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
        
        color: const Color(0xff094067)
        )
        )
        
        
          ],
        ),
      )
      
      
      ],),
      
      
      
      ),
    );
  }
}