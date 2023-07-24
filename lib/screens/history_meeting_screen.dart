import 'package:connect_now/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FiresStoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
            ),
            subtitle: Text(
              'Joined On: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
            ),
          )
        );
      },
    );
  }
}
