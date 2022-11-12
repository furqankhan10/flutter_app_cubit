import 'dart:io';


void main(){

  performTask();
}

void performTask()async{
  task1();
 String? res = await task2();
  task3(res);
}

void task1(){
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<dynamic> task2()async{
  Duration  duration = Duration(seconds: 3);
  var result;
 await Future.delayed(duration,(){
    result = 'Task 2 data';
    print('Task 2 complete');
  });
  return result;

}

void task3(String? task2Data){
  String result = 'Task 3 data';
  print('Task 3 complete with $task2Data');
}
