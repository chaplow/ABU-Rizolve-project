import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:abu_rizolve/services/database.dart';
import 'package:intl/intl.dart';

class Complaint extends StatefulWidget {
  final String name, roll;

  Complaint(this.name, this.roll);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  TextEditingController level = TextEditingController();
  TextEditingController complaint = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String complaintType = 'Others';

  DatabaseMethods databaseMethods = DatabaseMethods();

  String date = '${DateFormat.yMMMd().format(DateTime.now())}';

  addComplaint() async {
    Map<String, String> complaintDetails = {
      "name": widget.name,
      "regNo": widget.roll,
      "level": level.text,
      "complaint": complaint.text,
      "date": date,
      'time': Timestamp.now().toString()
    };
    if (complaintType == "Others" ||
        complaintType == 'Regarding Course' ||
        complaintType == 'Regarding Course Form' ||
        complaintType == 'Regarding Exam Card' ||
        complaintType == "Regarding Lecturer") {
      // try {
      //   await databaseMethods.sendcomplaintDetailsWarden(complaintDetails);
      // } catch (e) {
      //   print(e.toString());
      // }
      try {
        await databaseMethods.sendcomplaintDetailsAdmin(complaintDetails);
      } catch (e) {
        print(e.toString());
      }

      scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(new SnackBar(content: Text("Complaint Sent!")));
    }
  }

  sendpending(complaintDetails) async {
    FirebaseFirestore.instance
        .collection("student-list")
        .doc("${widget.roll}")
        .collection("Pending")
        .doc()
        .set(complaintDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  addpending() async {
    Map<String, String> complaintDetails = {
      "name": widget.name,
      "regNo": widget.roll,
      "complaint": complaint.text,
      "date": date,
      'time': Timestamp.now().toString(),
    };

    try {
      await sendpending(complaintDetails);
    } catch (e) {
      print(e.toString());
    }

    // Fluttertoast.showToast(msg: 'FeedBack Sent');

    // ignore: deprecated_member_use
    // ShowSnackBar(new SnackBar(content: Text("FeedBack Sent!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File a complaint")),
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, backgroundBlendMode: BlendMode.saturation

                /* borderRadius: BorderRadius.horizont()*/
                ),
            child: DropdownButton<String>(
              value: complaintType,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blue),
              onChanged: (String newValue) {
                setState(() {
                  complaintType = newValue;
                });
              },
              items: <String>[
                'Others',
                'Regarding Course',
                'Regarding Course Form',
                'Regarding Exam Card',
                'Regarding Lecturer'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: complaint,
                minLines: 10,
                maxLines: 15,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Complaint',
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
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: level,
            decoration: InputDecoration(
                hintText: " Level",
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              addComplaint();
              addpending();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "SEND",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ),
    );
  }
}
