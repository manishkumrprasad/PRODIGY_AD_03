import 'package:flutter/material.dart';

class LapRecordContainer extends StatelessWidget {
  const LapRecordContainer({
    required this.lapNumber,
    required this.lapTiming,
    super.key,
  });

  final String lapNumber;
  final String lapTiming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 160,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white, 
          // boxShadow: ,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          //! Handles the inside content of the LapBox
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, right: 6, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lapNumber,
                    style: TextStyle(
                      fontSize: 22,
                      // color: Colors.grey.shade600,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Oswald",
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      // color: Colors.grey.shade600,
                      color: const Color.fromARGB(255, 18, 17, 17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10), //! LAP + &{index+1}
            //   child:
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 4),
              child: Text(
                lapTiming,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                  fontSize: 22,
                  fontFamily: "Oswald",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
