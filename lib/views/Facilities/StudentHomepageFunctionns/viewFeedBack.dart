import 'package:flutter/material.dart';

class ViewFeedBack extends StatefulWidget {
  final String title;
  final String complaint;
  final String feedback;
  ViewFeedBack(
    this.title,
    this.complaint,
    this.feedback,
  );

  @override
  _ViewFeedBackState createState() => _ViewFeedBackState();
}

class _ViewFeedBackState extends State<ViewFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Complaint")),
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
                    widget.feedback,
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
