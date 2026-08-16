import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_managment_proj/controllers/bloc/bloc/task_bloc.dart';

import 'package:state_managment_proj/model/Task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(title),
        ),
        body: BlocProvider(
          create: (context) => TaskBloc(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'Enter a task'),
                ),
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        controller.text.isNotEmpty
                            ? context.read<TaskBloc>().add(
                                AddTask(controller.text),
                              )
                            : null;
                        controller.clear();
                      },
                      child: Text('Add Task'),
                    );
                  },
                ),

                // listView
                BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.taskList.length,
                        itemBuilder: (context, index) {
                          print(state.taskList.length);
                          Task task = state.taskList[index];
                          return ListTile(
                            title: Text(task.title),
                            leading: Checkbox(
                              value: task.isCompleted,
                              onChanged: (value) {
                                context.read<TaskBloc>().add(
                                  Toggletask(task.id),
                                );
                              },
                            ),
                            trailing: IconButton(
                              onPressed: () => context.read<TaskBloc>().add(
                                RemoveTask(task.id),
                              ),
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
