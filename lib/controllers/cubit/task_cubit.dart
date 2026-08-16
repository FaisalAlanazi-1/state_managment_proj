// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
// import 'package:state_managment_proj/model/Task.dart';
// import 'package:uuid/uuid.dart';

// part 'task_state.dart';

// class TaskCubit extends Cubit<TaskState> {
//   TaskCubit() : super(TaskInitial());
//   void addTask(String title) {
//     Task task = Task(Uuid().v4(), title, false);
//     emit(UpdateTask([...state.taskList, task]));
//   }

//   void removeTask(String taskId) {
//     List<Task> newTaskList = state.taskList
//         .where((task) => task.id != taskId)
//         .toList();

//     emit(UpdateTask(newTaskList));
//   }

//   void toggletask(String taskId) {
//     List<Task> newTaskList = state.taskList.map((task) {
//       return task.id == taskId
//           ? task.copyWith(isCompleted: !task.isCompleted)
//           : task;
//     }).toList();
//     emit(UpdateTask(newTaskList));
//   }
// }
