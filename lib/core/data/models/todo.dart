class Todo {
   String? dayId;
   int? id;
   String? title;
     String? desc; 
     int? done;
       String? date;




  Todo({this.id,this.dayId, this.title, this.desc, this.done, this.date});

  Todo copyWith(  {String? dayId,
   int? id,
   String? title,
     String? desc,
     int? done,
       String? date}){

return Todo(
  id: id??this.id, 
  title: title??this.title, 
  desc: desc??this.desc, 
  done: done??this.done, 
  date: date??this.date,
  dayId: dayId??this.dayId 

);
       }


 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc, 
      'done':done , 
      'date':date  , 
      'day_id':dayId
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Todo{id: $id, title: $title , desc:$desc ,done:$done ,date: $date ,day_id:$dayId}';
  }
  
}