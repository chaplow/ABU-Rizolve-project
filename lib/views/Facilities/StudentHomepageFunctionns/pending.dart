import 'package:abu_rizolve/views/Facilities/StudentHomepageFunctionns/viewpending.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PendingComplain extends StatefulWidget {
  final String roll;

  PendingComplain(
    this.roll,
  );
  @override
  _PendingComplainState createState() => _PendingComplainState();
}

class _PendingComplainState extends State<PendingComplain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pending'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('student-list')
                .doc('${widget.roll}')
                .collection('Pending')
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
                          title: new Text(
                              'Pending Complain on ${document['date']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Viewpending(
                                document['complaint'].toString(),
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
