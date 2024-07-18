import 'package:alumini_final/pages/update_screens/get_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String deletedocumentId = '';

setEventDocumentId(String id) {
  deletedocumentId = id;
}

class GetEvents extends StatefulWidget {
  final String eventDocumentID;
  GetEvents({required this.eventDocumentID, super.key});

  @override
  State<GetEvents> createState() => _GetEventsState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final User? user = _firebaseAuth.currentUser;

void getEventDocumentIdByCondition() async {
  final QuerySnapshot querySnapshot = await _firestore
      .collection('events')
      .where('email', isEqualTo: user!.email)
      .get();

  try {
    if (querySnapshot != null) {
      final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      String deletedocumentId = documentSnapshot.id;
      setEventDocumentId(deletedocumentId);
    } else {
      null;
    }
  } on StateError catch (e) {
    return null;
  }
}

void DeleteEvent(String id) {
  _firestore.collection("events").doc(deletedocumentId).delete();
}

class _GetEventsState extends State<GetEvents> {
  void initState() {
    getEventDocumentIdByCondition();
    super.initState();
  }

  @override
  void dispose() {
    getEventDocumentIdByCondition();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      email = user.email!;
    } else {}
    CollectionReference eventCollectionRef =
        FirebaseFirestore.instance.collection('events');
    return FutureBuilder<DocumentSnapshot>(
      future: eventCollectionRef.doc(widget.eventDocumentID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> eventdata =
              snapshot.data!.data() as Map<String, dynamic>;
          final text = eventdata['title'];
          final imageurl = eventdata['imagesUrl'];
          final description = eventdata['description'];
          final timestamp = eventdata['timestamp'] as Timestamp?;
          bool showDeleteIcon = true;
          // Check if eventdata['timestamp'] is not null before converting it to a date
          String dateStr;
          if (timestamp != null) {
            final date = timestamp.toDate();
            dateStr = date.toString().split(' ')[0];
          } else {
            // Handle the case when eventdata['timestamp'] is null
            dateStr = 'N/A';
          }

// Use the 'dateStr' variable in your code
// ...

          // if('admin1@gmail.com' == emailcontroller.text.trim()|| 'admin2@gmail.com' == emailcontroller.text.trim())
          // {
          //    return GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => EventImage(
          //                 image: imageurl,
          //                 title: text,
          //                 eventdescription: description),
          //           ));
          //     },
          //     child: Card(
          //         child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   const Text(
          //                     "Name:",
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.w600, fontSize: 17),
          //                   ),
          //                   const SizedBox(
          //                     width: 10,
          //                   ),
          //                   Text(
          //                     "${eventdata['title']}",
          //                     style: const TextStyle(
          //                         fontWeight: FontWeight.w500, fontSize: 17),
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Row(
          //                 children: [
          //                   const Text(
          //                     "Time:",
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.w600, fontSize: 17),
          //                   ),
          //                   const SizedBox(
          //                     width: 10,
          //                   ),
          //                   Text(
          //                     "${eventdata['timestamp'].toDate().toString().split(' ')[0]}",
          //                     style: const TextStyle(
          //                         fontWeight: FontWeight.w500, fontSize: 17),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           AnimatedSwitcher(
          //             duration: const Duration(milliseconds: 200),
          //             transitionBuilder:
          //                 (Widget child, Animation<double> animation) {
          //               return SlideTransition(
          //                 position: Tween<Offset>(
          //                   begin: const Offset(1, 0),
          //                   end: Offset.zero,
          //                 ).animate(animation),
          //                 child: child,
          //               );
          //             },
          //             child: showDeleteIcon
          //                 ? IconButton(
          //                     onPressed: () {
          //                       setState(() {
          //                         showDeleteIcon = false;
          //                         Navigator.pop(context);
          //                       });
          //                       DeleteEvent(deletedocumentId);
          //                     },
          //                     icon: const Icon(Icons.delete),
          //                   )
          //                 : const SizedBox(),
          //           ),
          //           // Column(
          //           //   children: [
          //           //     IconButton(
          //           //         onPressed: () {
          //           //           DeleteEvent(deletedocumentId);
          //           //         },
          //           //         icon: const Icon(Icons.delete))
          //           //   ],
          //           // )
          //         ],
          //       ),
          //     )),
          //   );

          // }
          if ('${eventdata['email']}' == email) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventImage(
                          image: imageurl,
                          title: text,
                          eventdescription: description),
                    ));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Name:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${eventdata['title']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Time:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              dateStr,
                              // "${eventdata['timestamp'].toDate().toString().split(' ')[0]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      child: showDeleteIcon
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  showDeleteIcon = false;
                                  Navigator.pop(context);
                                });
                                DeleteEvent(deletedocumentId);
                              },
                              icon: const Icon(Icons.delete),
                            )
                          : const SizedBox(),
                    ),
                    // Column(
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {
                    //           DeleteEvent(deletedocumentId);
                    //         },
                    //         icon: const Icon(Icons.delete))
                    //   ],
                    // )
                  ],
                ),
              )),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventImage(
                          image: imageurl,
                          title: text,
                          eventdescription: description),
                    ));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${eventdata['title']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Time:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          dateStr,
                          // "${eventdata['timestamp'].toDate.toString().split(' ')[0]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            );
          }
        }
        return const Center(
            child: Text(
          "No more events",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
        ));
      },
    );
  }
}
