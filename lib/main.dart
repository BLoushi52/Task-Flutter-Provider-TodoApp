import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'pages/add_task_page.dart';
import 'pages/list_page.dart';

void main() {
  runApp(MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ListPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddTaskPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskProvider(),
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
