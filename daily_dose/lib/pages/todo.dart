import 'package:flutter/material.dart';

class Todo {
  final String task;
  bool isCompleted;

  Todo({
    required this.task,
    this.isCompleted = false,
  });
}

class TodoCategory {
  final String name;
  final List<Todo> todos;

  TodoCategory({
    required this.name,
    required this.todos,
  });
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<TodoCategory> categories = [
    TodoCategory(
      name: 'Morning',
      todos: [
        Todo(task: 'Morning Reflection'),
        Todo(task: 'Submit The Presentation'),
      ],
    ),
    TodoCategory(
      name: 'Afternoon',
      todos: [
        Todo(task: 'Check-in with my thoughts'),
        Todo(task: 'Meeting with the team'),
        Todo(task: 'Have a snack'),
      ],
    ),
    TodoCategory(
      name: 'Evening',
      todos: [
        Todo(task: 'Eat dinner'),
        Todo(task: 'Watch a movie'),
        Todo(task: 'Go to bed early'),
      ],
    ),
  ];

  void toggleTodoCompleted(Todo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted;
    });
  }

  double getProgress() {
    int completedCount = 0;
    int totalCount = 0;
    for (TodoCategory category in categories) {
      for (Todo todo in category.todos) {
        if (todo.isCompleted) {
          completedCount++;
        }
        totalCount++;
      }
    }
    return totalCount == 0 ? 0 : completedCount / totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      "${(getProgress() * 100).toInt()}%",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width * 0.97,
              margin: EdgeInsets.all(15),
              child: LinearProgressIndicator(
                minHeight: 10,
                value: getProgress(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  TodoCategory category = categories[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ...category.todos.map((todo) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          child: CheckboxListTile(
                            title: Text(todo.task),
                            value: todo.isCompleted,
                            onChanged: (value) {
                              toggleTodoCompleted(todo);
                            },
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
