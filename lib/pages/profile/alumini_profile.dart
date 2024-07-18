import 'package:alumini_final/colors.dart';
import 'package:flutter/material.dart';

class AluminiProfile extends StatefulWidget {
  Map<String, dynamic> data1;

  AluminiProfile({
    Key? key,
    required this.data1,
  }) : super(key: key);

  @override
  State<AluminiProfile> createState() => _AluminiProfileState();
}

class _AluminiProfileState extends State<AluminiProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if ('${widget.data1['number']}' == '1')
              showUserDetails(
                widget.data1['name'],
                widget.data1['designation'],
                widget.data1['location'],
                widget.data1['contact'],
                widget.data1['branch'],
                widget.data1['batch'],
                widget.data1['dob'],
                'Industry name',
                widget.data1['industryname'],
                "Designation",
                widget.data1['designation'],
                'Location',
                widget.data1['location'],
              )
            else if ('${widget.data1['number']}' == '2')
              showHigherStudyUserDetails()
            else if (widget.data1['number'] == '3')
              showUserDetails(
                  widget.data1['name'],
                  widget.data1['designation'],
                  widget.data1['location'],
                  widget.data1['contact'],
                  widget.data1['branch'],
                  widget.data1['batch'],
                  widget.data1['dob'],
                  "About Business",
                  widget.data1['about business'],
                  "Designation",
                  widget.data1['designation'],
                  "Location",
                  widget.data1['location'])
            else if (widget.data1['number'] == '4')
              showUserDetails(
                widget.data1['name'],
                widget.data1['batch'],
                widget.data1['location'],
                widget.data1['contact'],
                widget.data1['branch'],
                widget.data1['batch'],
                widget.data1['dob'],
                "Preparing at",
                widget.data1['instituteown'],
                "Preparing for",
                widget.data1['preparing for'],
                "Location",
                widget.data1['location'],
              )
            else if ('${widget.data1['number']}' == '5')
              showUserDetails(
                  widget.data1['name'],
                  widget.data1['training role'],
                  widget.data1['training location'],
                  widget.data1['contact'],
                  widget.data1['branch'],
                  widget.data1['batch'],
                  widget.data1['dob'],
                  "Institute/College",
                  widget.data1['institute/college'],
                  "Training Role",
                  widget.data1['training role'],
                  "Training Location",
                  widget.data1['training location'])
            else if ('${widget.data1['number']}' == '6')
              showUserDetails(
                  widget.data1['name'],
                  widget.data1['designation'],
                  widget.data1['location'],
                  widget.data1['contact'],
                  widget.data1['branch'],
                  widget.data1['batch'],
                  widget.data1['dob'],
                  "Bank Name",
                  widget.data1['bank name'],
                  "Designation",
                  widget.data1['designation'],
                  "Location",
                  widget.data1['location'])
            else if ('${widget.data1['number']}' == '7')
              showUserDetails(
                  widget.data1['name'],
                  widget.data1['skills at'],
                  widget.data1['location'],
                  widget.data1['contact'],
                  widget.data1['branch'],
                  widget.data1['batch'],
                  widget.data1['dob'],
                  "Searching for",
                  widget.data1['searching for'],
                  "Skills at",
                  widget.data1['skills at'],
                  "Location",
                  widget.data1['location'])
            else if ('${widget.data1['number']}' == '8')
              showGovtUserDetails()
            else if ('${widget.data1['number']}' == '9')
              showOtherUserDetails()
          ],
        ),
      ),
    );
  }

  Widget showUserDetails(
      String name,
      String accordingtouser1,
      String location,
      String contact,
      String branch,
      String batch,
      String dob,
      String accordingtouser2,
      String accordingtouser3,
      String accordingtouser4,
      String accordingtouser5,
      String accordingtouser6,
      String accordingtouser7) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: SizedBox(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/commonprofile.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(accordingtouser1,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(location,
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                        contact,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        branch,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        batch,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Date of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        dob,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        accordingtouser2,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        accordingtouser3,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        accordingtouser4,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        accordingtouser5,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        accordingtouser6,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        accordingtouser7,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showHigherStudyUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: SizedBox(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/commonprofile.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['degree'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['higheducationlocation'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                        widget.data1['contact'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Branch",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['branch'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        widget.data1['batch'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Currently Studying at",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['higheducation'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Degree",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['degree'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['higheducationlocation'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Started at",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['start date'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Ending at",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['end date'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showGovtUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: SizedBox(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/commonprofile.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['designation'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['location'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                        widget.data1['branch'],
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
                        "Contact",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['contact'],
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
                        widget.data1['batch'],
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
                        "Designation",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['designation'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Location",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['location'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget showOtherUserDetails() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), //or 15.0
                            child: SizedBox(
                              height: 90.0,
                              width: 90.0,
                              child: Image.asset('assets/commonprofile.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.data1['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                // letterSpacing: 1.0
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.data1['other'],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo_brand.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alumni Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
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
                        widget.data1['branch'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        widget.data1['contact'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        widget.data1['batch'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
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
                        "Other",
                        style: TextStyle(
                            // letterSpacing: 1.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.data1['other'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
