import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../additional/icons.dart';

import 'StudentFeedBack.dart';
import 'allcomplains.dart';

class StudentHomePage extends StatefulWidget {
  final String mobile, roll, name, level;

  StudentHomePage(this.mobile, this.roll, this.name, this.level);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  XFile _imageFile;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: ListView(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 60),
                            child: Text(
                              "Hello," '${widget.name}',
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              "Your dashboard",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/addphoto.png",
                      ),
                      radius: 40.0,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
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
                                        builder: (context) => AllComplains(
                                            widget.mobile,
                                            widget.roll,
                                            widget.name,
                                            widget.level)));
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          MyFlutterApp.complainticon,
                                          size: 75.0,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Complaints",
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
                                            StudentFeedBack(widget.roll)));
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.circle_notifications,
                                          size: 75.0,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Feedback",
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
                                    feesPayUrl();
                                  },
                                  child: Container(
                                    height: 275,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.brown[300],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              "CS Dept Website",
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
                                onTap: () {
                                  collegeWebsiteUrl();
                                },
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.web,
                                            size: 75.0,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "ABU Portal",
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
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
                                    child: Text(
                                      "Log Out",
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }

  feesPayUrl() async {
    const url = 'https://dcs.abu.edu.ng/public/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  collegeWebsiteUrl() async {
    const url = 'https://portal.abu.edu.ng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget imageProfile() {
    return Container(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: _imageFile == null
                ? AssetImage(
                    "assets/addphoto.png",
                  )
                : FileImage(File(_imageFile.path)),
            radius: 40.0,
          ),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.grey,
                  size: 24.0,
                ),
              ))
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              SizedBox(
                width: 50.0,
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
