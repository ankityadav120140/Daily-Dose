import 'package:daily_dose/pages/bottomNav.dart';
import 'package:daily_dose/pages/homePage.dart';
import 'package:flutter/material.dart';

class onboardingPage extends StatefulWidget {
  const onboardingPage({super.key});

  @override
  State<onboardingPage> createState() => _onboardingPageState();
}

class _onboardingPageState extends State<onboardingPage> {
  bool selected = false;
  Widget textBox(String name) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: selected ? Colors.deepOrange : Colors.white,
          border: Border.all(
            color: Colors.deepOrange,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  int _selectedIndex = -1; // set default value to -1 if no option is selected

  void _onOptionSelected(int index) {
    setState(() {
      selected = true;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      "Maximising Your Potential",
      "Overcoming Self Doubts",
      "Building Self Esteem",
      "Achieving Your Goal",
      "Dealing With Inner Critic",
      "Understanding Yourself Better",
      "Building Self Esteem",
      "Achieving Your Goal",
      "Dealing With Inner Critic",
      "Understanding Yourself Better",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Select your primary reason.',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onOptionSelected(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? Colors.deepOrange
                          : Colors.white,
                      border: Border.all(
                        color: Colors.deepOrange,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      options[index],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selected
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyBottomNavigationBar()));
              },
              label: Text(
                "Proceed",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Container(),
    );
  }
}
