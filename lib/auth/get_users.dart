import 'package:alumini_final/pages/profile/alumini_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GetUser extends StatefulWidget {
  final String documentId;

  GetUser({required this.documentId});

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AluminiProfile(data1: data),
                  ));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    backgroundImage: AssetImage('assets/commonprofile.png'),
                  ),
                  const SizedBox(width: 20),
                  if ('${data['number']}' == '1')
                    DisplayUser('${data['name']}', '${data['designation']}'),
                  if ('${data['number']}' == '2')
                    DisplayUser('${data['name']}', '${data['degree']}'),
                  if ('${data['number']}' == '3')
                    DisplayUser('${data['name']}', '${data['about business']}'),
                  if ('${data['number']}' == '4')
                    DisplayUser('${data['name']}', '${data['location']}'),
                  if ('${data['number']}' == '5')
                    DisplayUser('${data['name']}', '${data['training role']}'),
                  if ('${data['number']}' == '6')
                    DisplayUser('${data['name']}', '${data['designation']}'),
                  if ('${data['number']}' == '7')
                    DisplayUser('${data['name']}', '${data['location']}'),
                  if ('${data['number']}' == '8')
                    DisplayUser('${data['name']}', '${data['designation']}'),
                  if ('${data['number']}' == '9')
                    DisplayUser('${data['name']}', '${data['other']}'),
                  if ('${data['number']}' == '10')
                    DisplayUser('${data['name']}', '${data['designation']}'),
                ],
              ),
            )),
          );
        }
        return Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Card(
            child: Container(
              height: 60,
            ),
          ),
        );
      },
    );
  }

  Widget DisplayUser(
    String name,
    String accoringtouser,
  ) {
    return Expanded(
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
            ),
            Text(
              accoringtouser,
              style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
