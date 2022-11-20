import 'package:flutter/material.dart';
import 'package:stateful_example/task.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var tasks = <Task>[
    Task(text: "Watch foot match"),
    Task(text: "Push to Github"),
    Task(text: "Pray on time"),
    Task(text: "Finish coded task"),
  ];

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tasks"),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              onEditingComplete: () {
                print("Edit is complete ${controller.text}");

                setState(() {
                  tasks.add(Task(text: controller.text));
                });

                controller.clear();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: Row(
                    children: [
                      Checkbox(
                          value: tasks[index].isComplete,
                          onChanged: (v) {
                            setState(() {
                              tasks[index].isComplete =
                                  !tasks[index].isComplete;
                            });
                          }),
                      Expanded(child: Text(tasks[index].text)),
                      IconButton(
                          onPressed: tasks[index].isComplete == false
                              ? null
                              : () {
                                  setState(() {
                                    tasks.removeAt(index);
                                  });
                                },
                          icon: Icon(Icons.delete)),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ));
  }
}


// int x = c == 9 ? 5 : 4; 