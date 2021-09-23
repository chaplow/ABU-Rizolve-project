import 'package:abu_rizolve/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ViewComplaint extends StatefulWidget {
  final complaint;
  final regno;
  final name;

  ViewComplaint(this.complaint, this.regno, this.name);

  @override
  _ViewComplaintState createState() => _ViewComplaintState();
}

class _ViewComplaintState extends State<ViewComplaint> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController feedback = TextEditingController();
  String date = '${DateFormat.yMMMd().format(DateTime.now())}';
  DatabaseMethods databaseMethods = DatabaseMethods();

  sendFeedback(feedbackDetails) async {
    FirebaseFirestore.instance
        .collection("student-list")
        .doc("${widget.regno}")
        .collection("Feedback")
        .doc()
        .set(feedbackDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  addFeedBack() async {
    Map<String, String> feedbackDetails = {
      "name": widget.name,
      "regNo": widget.regno,
      "complaint": widget.complaint,
      "date": date,
      'time': Timestamp.now().toString(),
      'name-comp': 'Admin FeedBack',
      'feedback': feedback.text
    };

    try {
      await sendFeedback(feedbackDetails);
    } catch (e) {
      print(e.toString());
    }

    Fluttertoast.showToast(msg: 'FeedBack Sent');

    // ignore: deprecated_member_use
    // ShowSnackBar(new SnackBar(content: Text("FeedBack Sent!")));
  }

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
                Container(
                  child: Text(
                    widget.complaint,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: feedback,
                      minLines: 10,
                      maxLines: 15,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Feedback',
                        filled: true,
                        fillColor: Color(0xFFDBEDFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addFeedBack();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "SEND FEEDBACK",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [Text('data'), Text('data')],
                ),
              ],
            ),
          ),
        ));
  }
}
