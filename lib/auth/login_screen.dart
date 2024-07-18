// import 'package:alumini_final/colors.dart';
// import 'package:alumini_final/pages/update_screens/update_profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// final emailcontroller = TextEditingController();

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _rollnocontroller = TextEditingController();

//     Future signin() async {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailcontroller.text.trim(),
//           password: _rollnocontroller.text.trim());
//     }

//     void dispose() {
//       emailcontroller.dispose();
//       _rollnocontroller.dispose();
//       super.dispose();
//     }

//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Padding(padding: EdgeInsets.only(top: 70)),
//             const CircleAvatar(
//               radius: 70.0,
//               backgroundImage: AssetImage(
//                 "assets/logo_brand.png",
//               ),
//               backgroundColor: Colors.white,
//             ),
//             // Container(
//             //   padding: EdgeInsets.symmetric(vertical: 90),
//             //   decoration: BoxDecoration(
//             //     image: DecorationImage(
//             //       image: AssetImage('assets/Alumini_logo.png'),
//             //       fit: BoxFit.fitHeight,
//             //     ),
//             //     shape: BoxShape.rectangle,
//             //   ),
//             // ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: const [
//                 SizedBox(
//                   width: 50,
//                 ),
//                 Text(
//                   "Login",
//                   style: TextStyle(
//                     fontSize: 35,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: 25, top: 25),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(50.0),
//                   )),
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 1.7,
//                 padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                     )),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Email",
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Roboto'),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: BackgroundColor,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: TextField(
//                           controller: emailcontroller,
//                           decoration: const InputDecoration(
//                               border: InputBorder.none, hintText: 'Email'),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     const Text(
//                       "Roll-No",
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Roboto'),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: BackgroundColor,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20),
//                         child: TextField(
//                           controller: _rollnocontroller,
//                           decoration: const InputDecoration(
//                               border: InputBorder.none, hintText: 'Roll-No'),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             signin();
//                             Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UpdateScreen(),
//                                 ),
//                                 (route) => false);
//                           },
//                           child: Text('Sign-in'),
//                           style: ButtonStyle(
//                               elevation: const MaterialStatePropertyAll(2),
//                               shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                               ),
//                               padding: MaterialStateProperty.all(
//                                 const EdgeInsets.symmetric(
//                                     vertical: 17, horizontal: 50),
//                               ),
//                               backgroundColor:
//                                   MaterialStateProperty.all(primaryColor)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
