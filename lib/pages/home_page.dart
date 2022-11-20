import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> animals = [
    "cat",
    "dog",
    "duck",
  ];

  String? selectedAnimal;

  int counter = 0;

  List<Color> colors = [
    Colors.brown,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.cyan,
    Colors.pink,
  ];

  String firstLetter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton(
              isExpanded: true,
              value: selectedAnimal,
              items: animals
                  .map(
                    (animal) => DropdownMenuItem(
                      value: animal,
                      child: Text(animal),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                print(value![0]);

                setState(() {
                  firstLetter = value![0];
                  selectedAnimal = value;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$counter"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: colors[counter % colors.length],
                ),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Center(
                  child: Text(
                firstLetter,
                style: TextStyle(fontSize: 112),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
