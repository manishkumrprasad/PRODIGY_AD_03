import 'package:flutter/material.dart';
import 'package:stopwatch/lap_record_container.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? _timer;

  Duration _elapsedTime = Duration.zero;

  dynamic timerValue;
  String timeFormate(Duration duration) {
    String twodigite(int n) => n.toString().padLeft(2, '0');
    String hour = twodigite(duration.inHours);
    String min = twodigite(duration.inMinutes.remainder(60));
    String sec = twodigite(duration.inSeconds.remainder(60));

    return "$hour:$min:$sec";
  }

  void startWatch(bool isStart) {
    if (isStart) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _elapsedTime += Duration(seconds: 1);
          timerValue = _elapsedTime;
        });
      });
    } else if (!isStart) {
      _timer?.cancel();
    }

    // print(timeFormate(_elapsedTime));
  }

  // void stopWatch() {
  //   _timer.cancel();
  // }

  String buttonOneText = "Start";
  String buttonTwoText = "Reset";
  IconData buttonOneIcon = Icons.play_arrow;
  IconData buttonTwoIcon = Icons.restore;

  void changeButtonText() {
    if (buttonOneText == "Start") {
      buttonOneText = "Pause";
      buttonOneIcon = Icons.pause;
    } else if (buttonOneText == "Pause") {
      buttonOneText = "Start";
      buttonOneIcon = Icons.play_arrow;
    }
  }

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

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsetsGeometry.only(left: 20, right: 20),
          child: Column(
            children: [
              //! Top Circular Clock
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      //add a new lap when clicking
                    },
                    child: Container(
                      height: 225,
                      width: 225,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150),
                        boxShadow: List.filled(
                          10,
                          BoxShadow(
                            color: const Color(0xFFE7EBF7),
                            blurRadius: 8,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          timeFormate(_elapsedTime),
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //! Lap Records
              Padding(
                padding: const EdgeInsetsGeometry.only(top: 80),
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
                    //! -----------------------------------------------------------
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          setState(() {});

                          if (buttonOneText == "Start") {
                            startWatch(true);
                          } else if (buttonOneText == "Pause") {
                            startWatch(false);
                          }
                          changeButtonText();
                        },

                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            83,
                            109,
                            128,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(buttonOneIcon, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              buttonOneText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          // if (text == "Start") {
                          //   changeText("Pause" ,Icons.pause );
                          // }else if (widget.text == "Pause") {
                          //   changeText("Start" , Icons.play_arrow);
                          // }
                          setState(() {});
                        },

                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            83,
                            109,
                            128,
                          ),
                          // padding: const EdgeInsets.symmetric(
                          //   horizontal: 30,
                          //   vertical: 14,
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restore_sharp, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              buttonTwoText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! -----------------------------------------------------------
                    // BottomButton(icon: Icons.pause, text: "Start"),
                    // BottomButton(icon: Icons.restore, text: "Reset"),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
