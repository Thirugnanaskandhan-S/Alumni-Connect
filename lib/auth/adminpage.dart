import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

Future addAdminDetails(String name, String designation,String num) async {
  await FirebaseFirestore.instance.collection('users').add({
    'name': name,
    'designation': designation,
    'number' : "10"
  });
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController adminnamecontroller = TextEditingController();
    TextEditingController admindesignationcontroller = TextEditingController();
    TextEditingController adminnumcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          adminTextBox("Name", adminnamecontroller, TextInputType.emailAddress),
          adminTextBox(
              "Designation", admindesignationcontroller, TextInputType.text),
          ElevatedButton(
            onPressed: () {
              addAdminDetails(adminnamecontroller.text.trim(),
                  admindesignationcontroller.text.trim(),
                  adminnumcontroller.text.trim()
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SearchPage(),), (route) => false);
            },
            style: ButtonStyle(
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 15)),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  Widget adminTextBox(
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
}
