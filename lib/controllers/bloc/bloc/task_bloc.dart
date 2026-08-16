import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:state_managment_proj/model/Task.dart';
import 'package:uuid/uuid.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTask>((event, emit) {
      Task task = Task(Uuid().v4(), event.title, false);
      emit(UpdateTask([...state.taskList, task]));
    });

    on<RemoveTask>((event, emit) {
      List<Task> newTaskList = state.taskList
          .where((task) => task.id != event.id)
          .toList();

      emit(UpdateTask(newTaskList));
    });

    on<Toggletask>((event, emit) {
      List<Task> newTaskList = state.taskList.map((task) {
        return task.id == event.id
            ? task.copyWith(isCompleted: !task.isCompleted)
            : task;
      }).toList();
      emit(UpdateTask(newTaskList));
    });
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
  return UpdateTask((json['todo'] as List).map((e) => Task.fromJson(e)).toList());
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    // TODO: implement toJson
    return {
      'todo' : state.taskList.map((e) =>e.toJson()).toList() 
    };
  }
}
