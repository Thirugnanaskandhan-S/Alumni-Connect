import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  final QueryDocumentSnapshot tabBar1Data;
  const Tab1({key, required this.tabBar1Data}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              if ('${widget.tabBar1Data['number']}' == '1')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '2')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '3')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '4')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '5')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '6')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '7')
                currentUserTabView1()
              else if ('${widget.tabBar1Data['number']}' == '8')
                currentUserTabView1()
              else
                currentUserTabView1()
            ],
          )),
    );
  }

  Widget currentUserTabView1() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Branch",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.tabBar1Data['branch']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Batch",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.tabBar1Data['batch']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date Of birth",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.tabBar1Data['dob']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
         const SizedBox(
          height: 20,
        ),
          Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.tabBar1Data['contact']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
