import 'package:daily_dose/pages/homePage.dart';
import 'package:daily_dose/pages/messagePage.dart';
import 'package:daily_dose/pages/todo.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    TodoApp(),
    TimelineView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messeges',
          ),
        ],
      ),
    );
  }
}
