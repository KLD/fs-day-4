import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.push("/khaled", extra: "Rana");
              },
              child: Text("Page 2")),
          ElevatedButton(onPressed: () {}, child: Text("Page 3")),
        ],
      ),
    );
  }
}
