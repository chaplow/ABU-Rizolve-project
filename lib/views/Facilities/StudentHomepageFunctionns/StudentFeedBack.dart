import 'package:abu_rizolve/views/Facilities/StudentHomepageFunctionns/viewFeedBack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentFeedBack extends StatefulWidget {
  final String roll;

  StudentFeedBack(
    this.roll,
  );

  @override
  _StudentFeedBackState createState() => _StudentFeedBackState();
}

class _StudentFeedBackState extends State<StudentFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FeedBack'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('student-list')
                .doc('${widget.roll}')
                .collection('Feedback')
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
                      return Card(
                        elevation: 8.0,
                        child: new ListTile(
                          title: new Text('${document['name-comp']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewFeedBack(
                                document['name-comp'].toString(),
                                document['complaint'].toString(),
                                document['feedback'].toString(),
                              );
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
