import 'package:flutter/material.dart';

class LapRecordContainer extends StatelessWidget {
  LapRecordContainer({
    required this.lapNumber,
    required this.lapTiming,
    super.key,
  });

  String lapNumber;
  String lapTiming;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,

      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: ,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print("Deleted");
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  lapNumber,

                  style: TextStyle(
                    fontSize: 22,
                    // color: Colors.grey.shade600,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  lapTiming,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
