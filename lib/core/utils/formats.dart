import 'package:easy_localization/easy_localization.dart';

String getTodoId(){

  final f = DateFormat('yyyy-MM-dd', 'en_US');
  return f.format(DateTime.now());
}