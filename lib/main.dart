import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stateful_example/pages/page1.dart';
import 'package:stateful_example/pages/page2.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => Page1()),
    ),
    GoRoute(
      path: '/khaled',
      builder: ((context, state) => Page2(
            name: state.extra as String,
          )),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
