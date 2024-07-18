import 'dart:io';
import 'package:alumini_final/auth/login.dart';
import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({super.key});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  TextEditingController eventName = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  String eventname = '';
  String eventdescription = '';
  File? image;
  final _picker = ImagePicker();
  Future<void> _getImage() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
      });
    }
  }

  void sendMessage(
      String title, File? image, String description, String email) async {
    final messagesRef = FirebaseFirestore.instance.collection('events');
    if (image != null) {
      final storageref = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      await storageref.putFile(image);
      final imageurl = await storageref.getDownloadURL();
      messagesRef.add({
        'title': title,
        'imagesUrl': imageurl,
        'description': description,
        "timestamp": FieldValue.serverTimestamp(),
        'email': email
      });
    } else {
      messagesRef.add({
        'title': title,
        "timestamp": FieldValue.serverTimestamp(),
        'description': description,
        'email': email
      });
    }


      setState(() {
      eventname = '';
      image = null;
      eventdescription = '';
    });
  
  }

  @override
  Widget build(BuildContext context) {
    String EVENTNAME = eventName.text.trim();
    String EVENTDESCRIPTION = eventDescription.text.trim();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: 'Add ',
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Events',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (EVENTNAME.isEmpty || EVENTDESCRIPTION.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      const Text('Event Name and Description is required!'),
                  behavior: SnackBarBehavior.floating,
                  elevation: 1,
                  clipBehavior: Clip.hardEdge,
                  backgroundColor: primaryColor,
                ));
              } else {
                sendMessage(eventname, image, eventdescription,
                    emailcontroller.text.trim());

                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              updateEventBox('Event Name', eventName),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _getImage(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        textStyle: const TextStyle(fontSize: 17),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text('Pick Image'),
                    ),
                  ),
                ],
              ),
              if (image != null)
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: size.height / 3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: size.height / 1.7,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1.0),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  onChanged: (value) {
                    eventdescription = value;
                  },
                  textCapitalization: TextCapitalization.words,
                  controller: eventDescription,
                  cursorColor: primaryColor,
                  maxLines: 200,
                  decoration: const InputDecoration(
                      hintText: 'Event Description', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateEventBox(String hint, TextEditingController controller) {
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
        onChanged: (value) {
          setState(() {
            eventname = value;
          });
        },
        textCapitalization: TextCapitalization.sentences,
        cursorColor: primaryColor,
        controller: controller,
        maxLines: 100,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
