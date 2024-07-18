import 'dart:async';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/searchbypage.dart';
import 'package:alumini_final/pages/update_screens/events_notifications.dart';
import 'package:alumini_final/pages/update_screens/update_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../auth/get_users.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
  
class _SearchPageState extends State<SearchPage> {
  List<String> docIDs = [];
  Future getDocIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: 'Alumini ', 
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Connect',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
        actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchByPage(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateEvent(),
                    ));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => EventNotification())));
            },
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                // future is what you acutually waiting for
                future: getDocIDs(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    itemCount: docIDs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GetUser(documentId: docIDs[index]);
                    },
                  );
                }),
          ),
        
        ],
      ),
    );
  }
}

//   Widget CardFormat(String name, String profession, AssetImage assetImage) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AluminiProfile(),
//             ));
//       },
//       onLongPress: () => Colors.grey,
//       child: Card(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(width: 10),
//             CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 25,
//                 backgroundImage: assetImage),
//             SizedBox(width: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(fontFamily: 'Roboto', fontSize: 18),
//                 ),
//                 Text(
//                   profession,
//                   style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
//                 )
//               ],
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
