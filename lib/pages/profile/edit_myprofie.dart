import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/editpersonaltab.dart';
import 'package:alumini_final/pages/profile/editworktab.dart';
import 'package:flutter/material.dart';

class editprofile extends StatefulWidget {
  String name1;
  String batch1;
  String branch1;
  String dob1;
  String contact1;

  editprofile(
      {required this.name1,
      required this.batch1,
      required this.branch1,
      required this.dob1,
      required this.contact1,
      super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _edittabcontroller = TabController(length: 2, vsync: this);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: RichText(
                text: const TextSpan(
                    text: 'Edit ',
                    style: TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                          text: 'Profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ]),
              ),
              backgroundColor: primaryColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 20,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  const SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        indicatorColor: primaryColor,
                        controller: _edittabcontroller,
                        indicatorPadding: const EdgeInsets.symmetric(horizontal: 1),
                        indicatorWeight: 1,
                        indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'Personal Info',
                          ),
                          Tab(
                            text: 'Working Experience',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: _edittabcontroller,
                    children: [
                      EditPersonalTab(
                        name2: widget.name1,
                        batch2: widget.batch1,
                        branch2: widget.branch1,
                        dob2: widget.dob1,
                        contact2: widget.contact1
                      ),
                      const EditWorkTab()
                    ],
                  )),
                  // ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text('Save Changes'),
                  //     style: ButtonStyle(
                  //         textStyle: MaterialStateProperty.all(
                  //             const TextStyle(fontSize: 15)),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(primaryColor),
                  //         padding: MaterialStateProperty.all(
                  //             const EdgeInsets.symmetric(
                  //                 horizontal: 80, vertical: 15)),
                  //         shape: MaterialStateProperty.all(
                  //             RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(8)))))
                ]),
              ),
            ))));
  }
}
