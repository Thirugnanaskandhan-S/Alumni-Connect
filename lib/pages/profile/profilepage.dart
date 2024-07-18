import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/edit_myprofie.dart';
import 'package:alumini_final/pages/profile/tab1.dart';
import 'package:alumini_final/pages/profile/tab2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with SingleTickerProviderStateMixin {
  Future<void> deleteDocument() async {
    final FirebaseAuth deleteFirebaseAuth = FirebaseAuth.instance;
    final User? deleteuser = deleteFirebaseAuth.currentUser;
    QuerySnapshot deletecurrentuserSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: deleteuser!.email)
        .get();
    deletecurrentuserSnapshot.docs.forEach((document) {
      document.reference.delete();
    });
  }

  late TabController tabController;
  bool _isdisposed = false;

  @override
  void initState() {
    _isdisposed = true;
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext dialogContext = context;
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: 'My ',
              style: TextStyle(fontSize: 20),
              children: [
                TextSpan(
                    text: 'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ]),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: primaryColor,
                      title: const Text("Logout"),
                      content: const Text("Are you sure to logout"),
                      actions: [
                        MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            )),
                        MaterialButton(
                            onPressed: () {
                              deleteDocument();
                              Navigator.popAndPushNamed(context, '/login');

                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const Login(),
                              //     ),
                              //   );
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: FutureBuilder(
        future: fetchUserFields(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final QueryDocumentSnapshot tabbarData =
                snapshot.data! as QueryDocumentSnapshot;
            String name = snapshot.data!['name'];
            String batch = snapshot.data!['batch'];
            String branch = snapshot.data!['branch'];
            String dob = snapshot.data!['dob'];
            String contact = snapshot.data!['contact'];

            if ('${snapshot.data!['number']}' == '1') {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['designation'],
                        snapshot.data!['location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == '2') {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['degree'],
                        snapshot.data!['higheducationlocation'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "3") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['about business'],
                        snapshot.data!['location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "4") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(snapshot.data!['name'], snapshot.data!['batch'],
                        snapshot.data!['location'], name, batch, branch, dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "5") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['training role'],
                        snapshot.data!['training location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(TabBar2Data: tabbarData),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "6") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['designation'],
                        snapshot.data!['location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "7") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['branch'],
                        snapshot.data!['location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "8") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(
                        snapshot.data!['name'],
                        snapshot.data!['branch'],
                        snapshot.data!['location'],
                        name,
                        batch,
                        branch,
                        dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if ('${snapshot.data!['number']}' == "9") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    profileUser(snapshot.data!['name'], snapshot.data!['batch'],
                        snapshot.data!['other'], name, batch, branch, dob,contact),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      indicatorColor: primaryColor,
                                      controller: tabController,
                                      indicatorPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 1),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Tab1(tabBar1Data: tabbarData),
                                  Tab2(
                                    TabBar2Data: tabbarData,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }
          return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Card(
              child: Column(
                children: [Container(
                  height: 200,
                ),]
              ),
            ),
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot?> fetchUserFields() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot currentuserSnapshot = await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();
      if (currentuserSnapshot.docs.isNotEmpty) {
        return currentuserSnapshot.docs.first;
      } else {
        return null;
      }
    }
  }

  Widget profileUser(
      String name,
      String accordingtouser,
      String accordingtouser1,
      String name1,
      String batch,
      String branch,
      String dob,
      String contact
      ) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75))
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                  Expanded(
                    child: Column(
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
                        Text(accordingtouser,
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => editprofile(
                            name1: name,
                            batch1: batch,
                            branch1: branch,
                            dob1: dob,
                            contact1: contact,
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10)),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
