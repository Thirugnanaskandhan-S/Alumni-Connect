import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/update_screens/get_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventNotification extends StatefulWidget {
  const EventNotification({super.key});

  @override
  State<EventNotification> createState() => _EventNotificationState();
}

class _EventNotificationState extends State<EventNotification> {
  List<String> eventDocIds = [];

  Future getEventDocIDS() async {
    await FirebaseFirestore.instance
        .collection('events')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              eventDocIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
            ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
          future: getEventDocIDS(),
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              itemCount: eventDocIds.length,
              itemBuilder: (BuildContext context, int index) {
                return GetEvents(
                  eventDocumentID: eventDocIds[index],
                );
              },
            );
          },
        )),
      ]),
    );
  }
}
