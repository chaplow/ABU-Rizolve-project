import 'package:flutter/material.dart';
import 'package:abu_rizolve/services/database.dart';

class StudentRequestDetails extends StatefulWidget {
  final String name, roll, mail, level, mobile;

  StudentRequestDetails(
      this.name, this.roll, this.mail, this.level, this.mobile);

  @override
  StudentRequestDetailsState createState() => StudentRequestDetailsState();
}

class StudentRequestDetailsState extends State<StudentRequestDetails> {
  DatabaseMethods databaseMethods = DatabaseMethods();

  deleteRequest() {
    databaseMethods.deleteStudentRequest(widget.roll);

    Navigator.pop(context);
  }

  acceptRequest() {
    databaseMethods.deleteStudentRequest(widget.roll);

    Map<String, String> studentDetails = {
      "name": widget.name,
      "roll": widget.roll,
      "mobile": widget.mobile,
      "email": widget.mail,
      "level": widget.level,
    };

    databaseMethods.acceptStudentRequest(widget.roll, studentDetails);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Name of a Student :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            //   child: Row(children: <Widget>[
            //     Text("Branch :  ",
            //         style:
            //             TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            //     Text(widget.branch,
            //         style:
            //             TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
            //   ]),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Reg No :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.roll,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Mobile No. :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.mobile,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            //   child: Row(children: <Widget>[
            //     Text("Collage :  ",
            //         style:
            //             TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            //     Text(widget.collage,
            //         style:
            //             TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
            //   ]),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("E-mail :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.mail,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("level :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.level,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            //   child: Row(children: <Widget>[
            //     Text("Date of Birth :  ",
            //         style:
            //             TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            //     Expanded(
            //       child: Text(widget.dob,
            //           style: TextStyle(
            //               fontWeight: FontWeight.w500, fontSize: 18.0)),
            //     ),
            //   ]),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            //   child: Row(children: <Widget>[
            //     Text("Room No :  ",
            //         style:
            //             TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            //     Text(widget.room,
            //         style:
            //             TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
            //   ]),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
            //   child: Row(children: <Widget>[
            //     Text("Hostel Name :  ",
            //         style:
            //             TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            //     Text(widget.hostel,
            //         style:
            //             TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
            //   ]),
            // ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      deleteRequest();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Delete",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      acceptRequest();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Accept",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
