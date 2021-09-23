import 'package:abu_rizolve/additional/icons.dart';
import 'package:abu_rizolve/views/Facilities/StudentHomepageFunctionns/pending.dart';
import 'package:flutter/material.dart';

import 'Complaint.dart';

class AllComplains extends StatefulWidget {
  final String mobile, roll, name, level;
  AllComplains(this.mobile, this.roll, this.name, this.level);

  @override
  _AllComplainsState createState() => _AllComplainsState();
}

class _AllComplainsState extends State<AllComplains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Complaint(widget.name, widget.roll)));
                          },
                          child: Container(
                            height: 275,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.blueAccent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MyFlutterApp.complainticon,
                                      size: 75.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Send Complaint",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PendingComplain(widget.roll)));
                          },
                          child: Container(
                            height: 275,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.tealAccent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.pending,
                                      size: 75.0,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " Pending",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // // Row(
                  //   children: [
                  //     SizedBox(width: 10.0),
                  //     // Expanded(
                  //     //   flex: 1,
                  //     //   child: Column(children: [
                  //     //     GestureDetector(
                  //     //       onTap: () {
                  //     //         Navigator.push(
                  //     //             context,
                  //     //             MaterialPageRoute(
                  //     //                 builder: (context) =>
                  //     //                     FeedbackPage()));
                  //     //       },
                  //     //       child: Container(
                  //     //         height: 275,
                  //     //         width: 300,
                  //     //         decoration: BoxDecoration(
                  //     //           borderRadius: BorderRadius.circular(40.0),
                  //     //           color: Colors.pink[300],
                  //     //         ),
                  //     //         child: Column(
                  //     //           mainAxisAlignment:
                  //     //               MainAxisAlignment.center,
                  //     //           children: [
                  //     //             Row(
                  //     //               mainAxisAlignment:
                  //     //                   MainAxisAlignment.center,
                  //     //               children: [
                  //     //                 Icon(
                  //     //                   MyFlutterApp.feedbackicon,
                  //     //                   size: 75.0,
                  //     //                 ),
                  //     //               ],
                  //     //             ),
                  //     //             Row(
                  //     //               mainAxisAlignment:
                  //     //                   MainAxisAlignment.center,
                  //     //               children: [
                  //     //                 Text(
                  //     //                   "FeedBack",
                  //     //                   style: TextStyle(
                  //     //                       color: Colors.black,
                  //     //                       fontSize: 20.0,
                  //     //                       fontWeight: FontWeight.bold),
                  //     //                 ),
                  //     //               ],
                  //     //             ),
                  //     //           ],
                  //     //         ),
                  //     //       ),
                  //     //     ),
                  //     //   ]),
                  //     // )
                  //   ],
                  // ),

                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // feesPayUrl();
                              },
                              child: Container(
                                height: 275,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.brown[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.open_in_browser,
                                          size: 75.0,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Accepted",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 1,
                        child: Column(children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 275,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.lightGreen[300],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.web,
                                        size: 75.0,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Solved",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 35.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Navigator.of(context)
                  //                 .popUntil((route) => route.isFirst);
                  //           },
                  //           child: Container(
                  //               decoration: BoxDecoration(
                  //                   color: Colors.blue,
                  //                   borderRadius: BorderRadius.circular(30.0)),
                  //               width: MediaQuery.of(context).size.width,
                  //               padding: EdgeInsets.symmetric(vertical: 12.0),
                  //               child: Text(
                  //                 "Log Out",
                  //                 textAlign: TextAlign.center,
                  //                 textScaleFactor: 1.5,
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               )),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ]),
    );
  }
}
