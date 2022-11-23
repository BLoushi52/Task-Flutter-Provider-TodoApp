import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/add");
            },
            icon: Icon(Icons.add_box_outlined),
          ),
          // SizedBox(height: 30),
          CupertinoButton.filled(
            onPressed: () {
              context.read<TaskProvider>().removeAll();
            },
            child: const Text('Remove All'),
          ),
        ],
      ),
      body: (context.watch<TaskProvider>().tasks.isEmpty)
          ? Center(
              child: Text(
                "Empty task.",
                style: TextStyle(fontSize: 30, color: Colors.black26),
              ),
            )
          : ListView.builder(
              itemCount: context.watch<TaskProvider>().tasks.length,
              itemBuilder: ((context, index) => Container(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 22),
                        child: Row(
                          children: [
                            Checkbox(
                              value: context
                                  .watch<TaskProvider>()
                                  .tasks[index]
                                  .isComplete,
                              onChanged: (value) {
                                context
                                    .read<TaskProvider>()
                                    .changeTaskStatusByIndex(index);
                              },
                            ),
                            Expanded(
                              child: Text(
                                context.watch<TaskProvider>().tasks[index].text,
                              ),
                            ),
                            IconButton(
                              onPressed: context
                                      .watch<TaskProvider>()
                                      .tasks[index]
                                      .isComplete
                                  ? () {
                                      context
                                          .read<TaskProvider>()
                                          .removeTask(index);
                                    }
                                  : null,
                              icon: Icon(Icons.delete,
                                  color: context
                                          .watch<TaskProvider>()
                                          .tasks[index]
                                          .isComplete
                                      ? Colors.red
                                      : null),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
    );
  }
}
