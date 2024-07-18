import 'package:alumini_final/auth/adminpage.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/update_screens/update_profile.dart';

final TextEditingController emailcontroller = TextEditingController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    // emailcontroller.dispose();
    // _rollnocontroller.dispose();
    super.dispose();
  }

  Future signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: _rollnocontroller.text.trim());
      if (!disposed) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>  UpdateScreen(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      String errormessage = 'Error Occured';
      if (e.code == 'user-not-found') {
        errormessage = 'User not found.Please check your email';
      } else if (e.code == 'wrong-password') {
        errormessage = 'User not found.Please check your rollno';
      }
      if (!disposed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              errormessage,
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: BackgroundColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  final TextEditingController _rollnocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 40, 49, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/logo symbol.png'),
                  backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Please Login to continue",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  updateTextBox('Enter your email', emailcontroller,
                      TextInputType.emailAddress),
                  const SizedBox(
                    height: 15,
                  ),
                  updateTextBox("Enter your roll no", _rollnocontroller,
                      TextInputType.name),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if ("admin1@gmail.com" ==
                              emailcontroller.text.trim() || "admin2@gmail.com" ==
                              emailcontroller.text.trim()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminPage(),
                                ));
                          } else {
                            signin();
                          }
                        },
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 15)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(255, 128, 0, 1.0)
                                ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget updateTextBox(
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
