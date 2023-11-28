import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/core/controllers/todo_controller.dart';
import 'package:todos_app/core/data/models/todo.dart';
import 'package:todos_app/core/utils/sizes.dart';

class EditodoPage extends StatefulWidget {
  final Todo? todo;
  const EditodoPage({super.key, this.todo});

  @override
  State<EditodoPage> createState() => _EditodoPageState();
}

class _EditodoPageState extends State<EditodoPage> {
    final titleController = TextEditingController();
  final detailsController = TextEditingController();
final formKey=GlobalKey<FormState>();


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleController.text = widget.todo!.title!;
    detailsController.text = widget.todo!.desc!;

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

    
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
Navigator.pop(context);
        }, icon:  Icon(Icons.arrow_back_ios  ,
        
        
         color: Colors.white,
         size: isTablet(context)?40: 24,
         
         ))


        ,  

        Text(
"edit_todo".tr(),
style: TextStyle(
fontSize:isTablet(context)?30: 24,
fontWeight: FontWeight.w400,
color: Colors.white
)
),  
        const SizedBox.shrink()
      ],
    ),


  ),
) ,  
Container(
padding: const EdgeInsets.symmetric(vertical: 50 ,  horizontal: 20),
  margin: const EdgeInsets.only(top: 150),
  decoration: const BoxDecoration(
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(50) , 
  topRight: Radius.circular(50) , 
),
    color: Colors.white
  ),
child:  Form(
  key: formKey,
  
  child: Column(children: [  

Column( 
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ 

  Text(
"title".tr(),
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.w400,
color: Theme.of(context).colorScheme.onBackground
)
),
    const SizedBox(height: 8,),
       TextFormField(
              controller: titleController,
          validator: (str){
if (str!.isEmpty) {
  return context.locale.languageCode=="ar"?"هذا الحقل مطلوب":"this field is required";
}
return null;
          },
          decoration: InputDecoration(
contentPadding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
            hintText: "enter_title".tr(),
            hintStyle: const TextStyle(
fontSize: 24,
fontWeight: FontWeight.w400,
color: Colors.black,
),
        
          border: const OutlineInputBorder(
             borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          ),
enabledBorder: const OutlineInputBorder(
           borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          ), 
          focusedBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          )




          ),
        )

  ],
)


,
const SizedBox(height: 30,)

,

Column( 
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ 

  Text(
"detils".tr(),
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.w400,
color: Theme.of(context).colorScheme.onBackground
)
),
    const SizedBox(height: 8,),
       TextFormField(
          maxLines: 15,
controller: detailsController,
            validator: (str){
if (str!.isEmpty) {
  return context.locale.languageCode=="ar"?"هذا الحقل مطلوب":"this field is required";
}
return null;
            },
          decoration: InputDecoration(
contentPadding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
            hintText: "enter_details".tr(),
            hintStyle: const TextStyle(
            
fontSize: 24,
fontWeight: FontWeight.w400,
color: Colors.black,
),
        
          border: const OutlineInputBorder(
             borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          ),
enabledBorder: const OutlineInputBorder(
           borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          ), 
          focusedBorder: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.black , width: 1) ,
            borderRadius: 
          BorderRadius.horizontal(
            
            left: Radius.circular(5)
          )
          )




          ),
        )

  ],
)
,  

const Spacer(),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [


    Expanded(

      flex: 1,
      child: GestureDetector(
        onTap: (){

if (formKey.currentState!.validate()) {
  

  var todo = widget.todo;

  todo!.title =  titleController.text;
  todo.desc= detailsController.text;


  provider.update2(context, todo);
}
        },
        child: Container(
        // width: 350,
        height: 60,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff3da9fc)),  
        
        child:   Center(
        
          child:  Text(
        "save".tr(),
        style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        )
        ),
        ),
        ),
      ),
    ),

const SizedBox(width: 10,),
    Expanded(flex: 1,
      child: GestureDetector(
        onTap: (){

 provider.delete(context, widget.todo!);


        },
        child: Container(
        height: 60,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffef4565)),  
        
         child:   Center(
        
          child:  Text(
        "delete".tr(),
        style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        )
        ),
        ),
        ),
      ),
    )
  ],
)

],)),
)




  ],
),


    );
    
    
    const CustomScrollView(



    );
  }
}