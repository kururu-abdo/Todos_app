import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/app/new_todo/view/new_todo.dart';
import 'package:todos_app/app/todos/view/widgets/todo_container.dart';
import 'package:todos_app/core/controllers/todo_controller.dart';
import 'package:todos_app/core/utils/sizes.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     context.read<TodoController>().getTodos();
});
  }
  @override
  Widget build(BuildContext context) {

var provider = Provider.of<TodoController>(context);

    return 
     Scaffold(

body: Stack(

  children: [   

SizedBox.expand(
  child: Container(
    padding: const EdgeInsets.only(
      top: 50 , 
      left: 20 , right: 20
    ),
    color: Theme.of(context).primaryColor,
    alignment: Alignment.topCenter,
    child:
     Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ 

Text(
"app_name".tr(),
style: TextStyle(
fontSize: 24,
color: Theme.of(context).colorScheme.onPrimary,
fontWeight: FontWeight.w400,
)
), 
const SizedBox(

  height: 14,
),
SizedBox(
  width:
  
  isTablet(context)?
  600:
  
   350, 
  height:  isTablet(context)?60: 40,
  child: Directionality(
    textDirection: TextDirection.ltr,
    child: Row(
      children: [  
    
         Expanded(
          flex: 2,
          child: 
          
          TextField(
            
            decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 
    
    
    isTablet(context)? 20:
    10 , horizontal: 10),
              hintText: "search_hint".tr(),
              hintStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    ),
            filled: true, 
            fillColor: const Color(0x38ffffff),
            border: const OutlineInputBorder(
              borderSide:BorderSide.none ,
              borderRadius: 
            BorderRadius.horizontal(
              
              left: Radius.circular(50)
            )
            ),
    enabledBorder: const OutlineInputBorder(
              borderSide:BorderSide.none ,
              borderRadius: 
            BorderRadius.horizontal(
              
              left: Radius.circular(50)
            )
            ), 
            focusedBorder: const OutlineInputBorder(
              borderSide:BorderSide.none ,
              borderRadius: 
            BorderRadius.horizontal(
              
              left: Radius.circular(50)
            )
            )
    
    
    
    
            ),
          )) ,  
        
        
        
        
        Expanded(
          flex: 1,
          child: Container(
          decoration: const BoxDecoration(
            color: Colors.white ,  
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(50)
            )
          ),
          child:  Center(child:  
          Text(
    "search".tr(),
    style: TextStyle(
    fontSize: 18,
    color: Theme.of(context).primaryColor,
    fontWeight: FontWeight.w400,
    )
    )
          
          
          ,),
          ),
        )
      ],
    ),
  ),
)


      ],
    )
    //  Row(
    //   children: [
    //     IconButton(onPressed: (){

    //     }, icon: const Icon(Icons.arrow_back_ios ))
    //   ],
    // ),


  ),
) ,  
Container(
padding:  const EdgeInsets.symmetric(vertical:
50 ,  horizontal: 10),
  margin:  EdgeInsets.only(top:
  
  isTablet(context)? 200:
  
   150),
  decoration: const BoxDecoration(
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(50) , 
  topRight: Radius.circular(50) , 
),
    color: Colors.white
  ),
child: Builder(
  builder: (context) {
    if (provider.todos.isEmpty) {
      return const Center(child:Text('No Todos'));
    }
   else {
      return ListView(children: 
      provider.todos.map((e) =>    TodoContainer(

      todo: e,
      )).toList()
      
      
    //   const [
    
    //   TodoContainer()
    
    // ]
    
    
    ,);
    }
  }
),
)




  ],
),
floatingActionButton: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [


            SizedBox(
              width: 
              isTablet(context)?
              80:30,
              height:  isTablet(context)?
              80:30,
            
                child:
                
                 FloatingActionButton(
                  
                  
                  onPressed: (){
                    context.locale.languageCode=="ar"?

                context.setLocale(const Locale('en')): context.setLocale(const Locale('ar'));
            

                },  
                
                child:  Icon(Icons.translate,
                
                
                size:  isTablet(context)?50:24,
                 ),
                ),
              ),
        const SizedBox(height: 8,),

            SizedBox(
              width: 
              isTablet(context)?
              100:50,
              height:  isTablet(context)?
              100:50,
            
                child: FloatingActionButton(
                  
                  
                  onPressed: (){
                
                Navigator.of(context).push(
                  
                  MaterialPageRoute(builder: (_)=> const NewTodoPage())
                );
                },  
                
                child:  Icon(Icons.add,
                
                
                size:  isTablet(context)?50:24,
                 ),
                ),
              ),
        
        
          ],
        ),
),

    );
    
    
    const CustomScrollView(



    );
  }
}