part of 'task_bloc.dart';

sealed class TaskEvent {}
class AddTask extends TaskEvent {
 final String title ;

  AddTask(this.title); 
}
class RemoveTask extends TaskEvent {
 final String id ;

  RemoveTask(this.id);
}
 class Toggletask extends TaskEvent { 
 final String id ;

  Toggletask(this.id);

 }