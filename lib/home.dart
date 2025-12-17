import 'package:flutter/material.dart';
import 'package:stopwatch/bottom_button.dart';
import 'package:stopwatch/lap_record_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Icon(Icons.arrow_back_ios_new, size: 22),
        ),
        title: Text("StopWatch", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_rounded, size: 25),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsetsGeometry.only(left: 20, right: 20),
        child: Column(
          children: [
            //! Top Circular Clock
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Container(
                  height: 225,
                  width: 225,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: List.filled(
                      10,
                      BoxShadow(color: const Color(0xFFE7EBF7), blurRadius: 8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "00:00:00",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //! Lap Records
            Padding(
              padding: const EdgeInsetsGeometry.only(top: 120),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LapRecordContainer(
                      lapNumber: "LAP 1",
                      lapTiming: "00:00:00",
                    ),
                    SizedBox(width: 10),

                    LapRecordContainer(
                      lapNumber: "LAP 2",
                      lapTiming: "00:00:00",
                    ),
                    SizedBox(width: 10),

                    LapRecordContainer(
                      lapNumber: "LAP 3",
                      lapTiming: "00:00:00",
                    ),
                    SizedBox(width: 10),

                    LapRecordContainer(
                      lapNumber: "LAP 4",
                      lapTiming: "00:00:00",
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),

            //! Bottom Buttons
            Padding(
              padding: const EdgeInsetsGeometry.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomButton(icon: Icons.pause, text: "Start"),
                  BottomButton(icon: Icons.restore, text: "Reset"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
