import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget tile(String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.orangeAccent.shade100,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Image.asset(
                  "assets/kiss.jpg",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "2 minutes",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              // color: Colors.red,
              child: Icon(
                Icons.more_horiz,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget JournalWidget(String path, String title, int goals, int habits) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              path,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              "$goals Goal, $habits Habits",
            ),
          ),
        ],
      ),
    );
  }

  Widget activityWidget(
      String path, final Icon icon, int num, String activity, String mode) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          // borderRadius: BorderRadius.circular(20)
          ),
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            child: Image.asset(
              path,
            ),
          ),
          Row(
            children: [
              Container(
                child: icon,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text("$num"),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Text(
                  activity,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                child: Text(
                  mode,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      "Take a moment to notice what's happending today",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              tile("Mind Chatter"),
              tile("Feelings"),
              tile("Urgers"),
              tile("Behaviours"),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Reflect on your day",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Icon(
                        Icons.question_mark,
                        size: 17,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      "Journal your thoughts",
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    JournalWidget("assets/inde.jpg", "Being Independent", 1, 1),
                    JournalWidget("assets/inde.jpg", "Creativity", 1, 1),
                    JournalWidget("assets/inde.jpg", "Creativity", 1, 1),
                    JournalWidget("assets/inde.jpg", "Creativity", 1, 1),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    JournalWidget("assets/healthy.jpg", "Healthy Living", 1, 2),
                    JournalWidget("assets/healthy.jpg", "Legacy", 1, 0),
                    JournalWidget("assets/healthy.jpg", "Creativity", 1, 1),
                    JournalWidget("assets/healthy.jpg", "Legacy", 1, 0),
                    JournalWidget("assets/healthy.jpg", "Legacy", 1, 0),
                    JournalWidget("assets/healthy.jpg", "Legacy", 1, 0),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "Overcoming Self Doubts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    activityWidget("assets/overcome.jpg", Icon(Icons.book), 2,
                        "MIN", "Slef Doubts 101"),
                    activityWidget("assets/overcome.jpg", Icon(Icons.edit), 5,
                        "Exercise", "Building Confidence"),
                    activityWidget("assets/overcome.jpg",
                        Icon(Icons.headphones), 2, "MIN", "Audio Book"),
                    activityWidget("assets/overcome.jpg",
                        Icon(Icons.headphones), 2, "MIN", "Audio Book"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "Stop Procrastinating",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    activityWidget("assets/walk.jpg", Icon(Icons.book), 2,
                        "MIN", "Procrastination 101"),
                    activityWidget("assets/walk.jpg", Icon(Icons.edit), 5,
                        "Exercise", "Identifyign Reasons"),
                    activityWidget("assets/walk.jpg", Icon(Icons.headphones), 2,
                        "MIN", "Audio Book"),
                    activityWidget("assets/walk.jpg", Icon(Icons.headphones), 2,
                        "MIN", "Audio Book"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
