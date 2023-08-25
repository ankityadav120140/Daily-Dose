import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Plan {
  final String name;
  final String duration;

  Plan({
    required this.name,
    required this.duration,
  });
}

class TimelineView extends StatefulWidget {
  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  Widget tile(String name, String duration) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        // color: Colors.orangeAccent.shade100,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
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
                          duration,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  final List<Plan> plans = [
    Plan(name: 'Learning to say no', duration: '5 min'),
    Plan(name: 'Handling Mistakes', duration: '10 min'),
    Plan(name: 'Dealing with criticism', duration: '15 min'),
    Plan(name: 'Effective Communication', duration: '20 min'),
    Plan(name: 'Handling Mistakes', duration: '10 min'),
    Plan(name: 'Dealing with criticism', duration: '15 min'),
    Plan(name: 'Effective Communication', duration: '20 min'),
    Plan(name: 'Handling Mistakes', duration: '10 min'),
    Plan(name: 'Dealing with criticism', duration: '15 min'),
    Plan(name: 'Effective Communication', duration: '20 min'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Plan",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (BuildContext context, int index) {
                    Plan plan = plans[index];
                    return Container(
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.circle,
                              color: Colors.deepOrange,
                            ),
                          ),
                          tile(plan.name, plan.duration)
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
