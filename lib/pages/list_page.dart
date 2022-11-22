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
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TaskProvider>().tasks.length,
        itemBuilder: ((context, index) => Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                child: Text(
                  context.watch<TaskProvider>().tasks[index],
                ),
              ),
            )),
      ),
    );
  }
}
