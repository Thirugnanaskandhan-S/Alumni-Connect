import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String documentId = '';

setDocumentId(String id) {
  documentId = id;
}

class EditPersonalTab extends StatefulWidget {
  String name2;
  String batch2;
  String branch2;
  String dob2;
  String contact2;

  EditPersonalTab(
      {required this.name2,
      required this.batch2,
      required this.branch2,  
      required this.dob2,
       required this.contact2,
      super.key});
  @override
  State<EditPersonalTab> createState() => _EditPersonalTabState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final User? user = _firebaseAuth.currentUser;

void getDocumentIdByCondition() async {
  final QuerySnapshot querySnapshot = await _firestore
      .collection('users')
      .where('email', isEqualTo: user!.email)
      .get();

  final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
  String documentId = documentSnapshot.id;
  setDocumentId(documentId);
}

void updateCurrentUserPersonal(
    String name, String batch, String branch, String dob,String contact) {
  _firestore
      .collection('users')
      .doc(documentId)
      .update({'name': name, 'batch': batch, 'branch': branch, 'dob': dob,'contact' : contact});
}

class _EditPersonalTabState extends State<EditPersonalTab> {
  @override
  void initState() {
    getDocumentIdByCondition();
    super.initState();
  }

  Widget build(BuildContext context) {
    final TextEditingController editnameController =
        TextEditingController(text: widget.name2);
    final TextEditingController editBatchController =
        TextEditingController(text: widget.batch2);
    final TextEditingController editBranchController =
        TextEditingController(text: widget.branch2);
    final TextEditingController editDobController =
        TextEditingController(text: widget.dob2);
    final TextEditingController editcontactcontroller = TextEditingController(text:widget.contact2);
    
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        editTextBox('Name', editnameController, TextInputType.name),
        editTextBox('Batch', editBatchController, TextInputType.number),
        editTextBox('Branch', editBranchController, TextInputType.name),
        editTextBox('DOB', editDobController, TextInputType.datetime),
        editTextBox('Contact', editcontactcontroller, TextInputType.emailAddress),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () {
              updateCurrentUserPersonal(
                  editnameController.text.trim(),
                  editBatchController.text.trim(),
                  editBranchController.text.trim(),
                  editDobController.text.trim(),
                  editcontactcontroller.text.trim()
                  );
              Navigator.pop(context);
            },
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 15)),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
                     child:  const Text('Save Changes'),
                    )
      ],
    ));
  }

  Widget editTextBox(
      String hint, TextEditingController controller, TextInputType type) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: TextFormField(
        keyboardType: type,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
 
    );
  }

  // Future<DocumentSnapshot?> fetchUserFields() async {
  //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //   final User? user = _firebaseAuth.currentUser;

  //   if (user != null) {
  //     final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //     QuerySnapshot currentuserSnapshot = await _firebaseFirestore
  //         .collection('users')
  //         .where('email', isEqualTo: user.email)
  //         .get();
  //     if (currentuserSnapshot.docs.isNotEmpty) {
  //       return currentuserSnapshot.docs.first;
  //     } else {
  //       return null;
  //     }
  //   }
  // }
}
