import 'package:abu_rizolve/views/Facilities/StudentHomepageFunctionns/anonHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abu_rizolve/services/database.dart';

class AnonSignUp extends StatefulWidget {
  @override
  AnonSignUpState createState() => AnonSignUpState();
}

class AnonSignUpState extends State<AnonSignUp> {
  String userid;
  String userid2;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      userid = DateTime.now().microsecond.toString();
      userid2 = DateTime.now().millisecond.toString();
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController regNo = TextEditingController();
  // TextEditingController roomNo = TextEditingController();
  QuerySnapshot querySnapshot;

  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2022),
        initialDatePickerMode: DatePickerMode.year,
        context: context);
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // String collage = 'Select Your College';
  // String branch = 'Select Your Branch';
  String level = 'Select Your Level';
  // String hostel = 'Select Your Hostel';
  DatabaseMethods databaseMethods = DatabaseMethods();

  addstudentList() {
    databaseMethods.deleteStudentRequest(regNo.text);

    Map<String, String> studentDetails = {
      "name": name.text,
      "roll": regNo.text,
      "mobile": mobileNo.text,
      "email": email.text,
      "level": level,
    };

    databaseMethods.acceptStudentRequest(regNo.text, studentDetails);
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In as Anonymous"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Column(
          children: [
            // Container(
            //   child: Center(
            //     child: Text("Enter details to proceed!",
            //         style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.w500,
            //             fontFamily: "FredokaOne")),
            //   ),
            // ),
            SizedBox(
              height: 15.0,
            ),
            Form(
              key: formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            enabled: false,
                            initialValue:
                                'Student${userid.toString()}${userid2.toString()}',
                            // controller: name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: userid.toString(),
                                // hintText:  "Full Name",

                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            validator: (value) => value.isEmpty
                                ? 'Enter Your Name'
                                : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                        .hasMatch(value)
                                    ? 'Enter a Valid Name'
                                    : value.length < 3
                                        ? 'Name must contain more than 3 characters'
                                        : null,
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    // Card(
                    //     elevation: 2,
                    //     color: Colors.blueGrey[200],
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     ),
                    //     child: ListTile(
                    //       title: TextFormField(
                    //         controller: mobileNo,
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //         decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: "Mobile Number",
                    //             hintStyle: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black54)),
                    //       ),
                    //     )),
                    // SizedBox(
                    //   height: 8.0,
                    // ),
                    // Card(
                    //     elevation: 2,
                    //     color: Colors.blueGrey[200],
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     ),
                    //     child: ListTile(
                    //       title: TextFormField(
                    //         controller: email,
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //         decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: "E-mail",
                    //             hintStyle:
                    //                 TextStyle(fontWeight: FontWeight.bold)),
                    //       ),
                    //     )),
                    // Card(
                    //     elevation: 2,
                    //     color: Colors.blueGrey[200],
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     ),
                    //     child: ListTile(
                    //       title: TextFormField(
                    //         controller: regNo,
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //         decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: "Reg Number",
                    //             hintStyle: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black54)),
                    //       ),
                    //     )),
                    // SizedBox(
                    //   height: 8.0,
                    // ),
                    // Card(
                    //     elevation: 2,
                    //     color: Colors.blueGrey[200],
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //     ),
                    //     child: ListTile(
                    //       title: new DropdownButtonHideUnderline(
                    //         child: DropdownButton<String>(
                    //           value: level,
                    //           icon: Icon(Icons.arrow_downward),
                    //           iconSize: 24,
                    //           elevation: 16,
                    //           onChanged: (String newValue) {
                    //             setState(() {
                    //               level = newValue;
                    //             });
                    //           },
                    //           style: const TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.black54,
                    //               fontSize: 16),
                    //           items: <String>[
                    //             'Select Your Level',
                    //             '100 Level',
                    //             '200 Level',
                    //             '300 Level',
                    //             '400 Level'
                    //           ].map<DropdownMenuItem<String>>((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //     )),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await addstudentList();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnonStudentHomePage(
                                        mobileNo.text,
                                        regNo.text,
                                        'Student${userid.toString()}${userid2.toString()}',
                                        level)),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30.0)),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  "Proceed",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       child: Text(
                    //         "Already have an account?",
                    //         style:
                    //             TextStyle(fontSize: 14.0, color: Colors.black),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: (() {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => StudentSignIn()),
                    //         );
                    //       }),
                    //       child: Container(
                    //         child: Text(
                    //           "Sign In",
                    //           style: TextStyle(
                    //               decoration: TextDecoration.underline,
                    //               fontSize: 14.0,
                    //               color: Colors.indigoAccent),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
