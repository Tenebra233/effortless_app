import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/menu.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<TaskData>(create: (context) => TaskData()),
        ListenableProvider<MenuController>(
            create: (context) => MenuController()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
