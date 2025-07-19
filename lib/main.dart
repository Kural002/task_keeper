import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_keeper/viewmodels/task_viewmodel.dart';
import 'package:task_keeper/views/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
class TaskKeeperApp extends StatelessWidget {
  const TaskKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
    
  }
}
