import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:abu_rizolve/additional/ForgotPassword.dart';
import 'package:abu_rizolve/services/database.dart';

import '../Facilities/AdminHomepageFunctionns/AdminHomepage.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  QuerySnapshot<Map<String, dynamic>> querySnapshot;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  // int index;

  adminAuthentication() async {
    // int index;
    await databaseMethods.getadmindetails().then((val) {
      setState(() {
        querySnapshot = val;
      });
    });
    if (querySnapshot.docs[0].data()['email'] == email.text &&
        querySnapshot.docs[0].data()['password'] == password.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AdminHomepage(querySnapshot.docs[0].data()['name'])),
      );

      // email.clear();
      // password.clear();
    } else {
      print(querySnapshot.docs[0].data()['email'].toString());
      scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(new SnackBar(content: Text("Invalid")));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AdminHomepage(querySnapshot.docs[0].data()['name'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(" Sign In"), backgroundColor: Colors.blue),
        key: scaffoldKey,
        body: Container(
            child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/welcome!.png"),
                        fit: BoxFit.cover)),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                            validator: (value) =>
                                value.isEmpty ? 'Enter a Valid email ' : null,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                return value.isEmpty
                                    ? "Please Enter Your Password"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()),
                                );
                              }),
                              child: Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.0,
                                      color: Colors.black),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState.validate())
                                    adminAuthentication();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    "Sign In",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ))));
  }
}
