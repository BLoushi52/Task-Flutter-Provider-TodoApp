import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(controller: controller),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TaskProvider>().addTask(controller.text);
              context.pop();
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
