import 'package:alumini_final/auth/login.dart';
import 'package:alumini_final/pages/home.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  final String admincheck ;
   const Authentication({required this.admincheck,super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if("admin1@gmail.com" == widget.admincheck || "admin2@gmail.com" ==widget.admincheck ){
              return const SearchPage();
            }
            else if (snapshot.hasData) {
              return const HomeScreen();
            }
            else {
              return const Login();
            }
          }),
    );
  }
}
