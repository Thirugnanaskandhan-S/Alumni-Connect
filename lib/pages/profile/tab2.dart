import 'package:alumini_final/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  final QueryDocumentSnapshot TabBar2Data;
  Tab2({Key? key, required this.TabBar2Data}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          if ('${widget.TabBar2Data['number']}' == "1")
            currentUserTabView2(
                "Industry Name",
                "${widget.TabBar2Data['industryname']}",
                "Designation",
                "${widget.TabBar2Data['designation']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if ('${widget.TabBar2Data['number']}' == '2')
            currentUserTabView2(
                "Degree",
                "${widget.TabBar2Data['degree']}",
                "Currently at",
                "${widget.TabBar2Data['higheducation']}",
                "Location",
                "${widget.TabBar2Data['higheducationlocation']}"),
          if ('${widget.TabBar2Data['number']}' == '3')
            currentUserTabView2(
                "Designation",
                "${widget.TabBar2Data['designation']}",
                "Currently at",
                "${widget.TabBar2Data['about business']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if ('${widget.TabBar2Data['number']}' == '4')
            currentUserTabView2(
                "Institute or Own",
                "${widget.TabBar2Data['instituteown']}",
                "Preparing for",
                "${widget.TabBar2Data['preparing for']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if ('${widget.TabBar2Data['number']}' == '5')
            currentUserTabView2(
                "Training Role",
                "${widget.TabBar2Data['training role']}",
                "Institute/College",
                "${widget.TabBar2Data['institute/college']}",
                "Training Location",
                "${widget.TabBar2Data['training location']}"),
          if ('${widget.TabBar2Data['number']}' == '6')
            currentUserTabView2(
                "Designation",
                "${widget.TabBar2Data['designation']}",
                "Bank Name",
                "${widget.TabBar2Data['bank name']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if ('${widget.TabBar2Data['number']}' == '7')
            currentUserTabView2(
                "Skills at",
                "${widget.TabBar2Data['skills at']}",
                "Searching for",
                "${widget.TabBar2Data['searching for']}",
                "Location",
                "${widget.TabBar2Data['location']}"),
          if ('${widget.TabBar2Data['number']}' == '8')
            Column(
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
                        "Designation",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${widget.TabBar2Data['designation']}',
                        style: const TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
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
                        'Location',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${widget.TabBar2Data['location']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if ('${widget.TabBar2Data['number']}' == '9')
            Column(
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
                        "Other",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${widget.TabBar2Data['other']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ]),
      ),
    );
  }

  Widget currentUserTabView2(String text1, String text2, String text3,
      String text4, String text5, String text6) {
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
              Text(
                text1,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text2,
                style: const TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
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
              Text(
                text3,
                style: const TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text4,
                style: const TextStyle(
                    // letterSpacing: 1.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
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
              Text(
                text5,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text6,
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
