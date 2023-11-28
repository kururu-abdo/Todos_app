import 'package:flutter/material.dart';
import 'package:todos_app/core/utils/sizes.dart';

class CheckBoxCircle extends StatelessWidget {
  final Function(bool)? onChange;
  final bool? isDone;
  const CheckBoxCircle({super.key, this.onChange, this.isDone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChange!(
          isDone! ? true:false
        );
      },
      child: Container(
        width: 
        
        isTablet(context)?  80:
        59,
      height:isTablet(context)?  80: 59,
      
      
      decoration: BoxDecoration(
        shape: BoxShape.circle ,  
      
        border: Border.all(width: .5)
      ),
      
      child: isDone!?
      Center(
        child: Icon(
      Icons.check, size:isTablet(context)?65: 50  ,
      color: Theme.of(context).primaryColor,
        ),
      ):const SizedBox.shrink()
      
      
      ,
      
      
      ),
    );
  }
}