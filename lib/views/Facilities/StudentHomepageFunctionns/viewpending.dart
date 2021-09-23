import 'package:flutter/material.dart';

class Viewpending extends StatefulWidget {
  final String complaint;

  Viewpending(
    this.complaint,
  );

  @override
  _ViewpendingState createState() => _ViewpendingState();
}

class _ViewpendingState extends State<Viewpending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pending Complaint")),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                  child: Text(
                    widget.complaint,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
