import 'package:alumini_final/auth/get_users.dart';
import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchByPage extends StatefulWidget {
  const SearchByPage({Key? key});

  @override
  State<SearchByPage> createState() => _SearchByPageState();
}

class _SearchByPageState extends State<SearchByPage> {
  List<String> searchdocIDs = [];
  Future<void> getSearchDocIDs() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      searchdocIDs = snapshot.docs.map((doc) => doc.reference.id).toList();
    });
  }

  List<DocumentSnapshot> searchresults = [];
  TextEditingController searchbyusercontroller = TextEditingController();

  Future<void> searchUsers(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThan: query + 'z')
        .get();
    setState(() {
      searchresults = snapshot.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    getSearchDocIDs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: size.width * 0.6,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(217, 217, 217, 1.0),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 45,
          child: TextFormField(
            onChanged: (value) {
              if (searchbyusercontroller.text.isNotEmpty) {
                searchUsers(value);
              }
            },
            keyboardType: TextInputType.name,
            cursorColor: Colors.black,
            textCapitalization: TextCapitalization.sentences,
            controller: searchbyusercontroller,
            decoration: const InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        itemCount: searchresults.length,
        itemBuilder: (BuildContext context, int index) {
          return GetUser(documentId: searchresults[index].reference.id);
        },
      ),
    );
  }
}
