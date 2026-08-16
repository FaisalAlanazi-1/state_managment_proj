part of 'task_bloc.dart';

sealed class TaskState  extends Equatable  {
final List<Task> taskList ;

  TaskState(this.taskList); 

    
  @override
  // TODO: implement props
  List<Object?> get props => [taskList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super ([]);

}

final class UpdateTask extends TaskState {
  UpdateTask(super.taskList );
  

}

