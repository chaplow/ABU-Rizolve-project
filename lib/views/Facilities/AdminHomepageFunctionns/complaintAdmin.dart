import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:abu_rizolve/views/Facilities/WardenAdminCommonHomepageFunctionns/viewComplaint.dart';

class ComplaintAdmin extends StatefulWidget {
  @override
  _ComplaintAdminState createState() => _ComplaintAdminState();
}

class _ComplaintAdminState extends State<ComplaintAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("STUDENT COMPLAINT")),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("user-admin")
                .doc("Admin")
                .collection("student-complaint")
                .orderBy('time', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      String anon = document['name'].toString();
                      String anonuser = anon.substring(0, 4);
                      return Card(
                        elevation: 8.0,
                        child: new ListTile(
                          title: anonuser == 'Stud'
                              ? Text('Complaint by Anon on ${document['date']}')
                              : new Text(
                                  'Complaint by ${document['name']} on ${document['date']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            print(anonuser);
                            print('${document['name']}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewComplaint(
                                  document['complaint'].toString(),
                                  document['regNo'].toString(),
                                  document['name'].toString());
                            }));
                          },
                        ),
                      );
                    }).toList(),
                  );
              }
            }));
  }
}
