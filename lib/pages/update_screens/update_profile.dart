import 'package:alumini_final/auth/login.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/home.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
export 'update_profile.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

Color primary = const Color.fromARGB(255, 103, 58, 183);
String birth = "Date of Birth";

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _industrydesignationcontroller =
      TextEditingController();
  final TextEditingController _industrynamecontroller = TextEditingController();
  final TextEditingController _industrylocationcontroller =
      TextEditingController();
  final TextEditingController _startdatecontroller = TextEditingController();
  final TextEditingController _enddatecontroller = TextEditingController();
  final TextEditingController _highcollegecontroller = TextEditingController();
  final TextEditingController _studylocationcontroller =
      TextEditingController();
  final TextEditingController _degreecontroller = TextEditingController();
  final TextEditingController _businessdesignationcontroller =
      TextEditingController();
  final TextEditingController _aboutbusinesscontroller =
      TextEditingController();
  final TextEditingController _businesslocationcontroller =
      TextEditingController();
  final TextEditingController _instituteowncontroller = TextEditingController();
  final TextEditingController _exampreparecontroller = TextEditingController();
  final TextEditingController _examlocation = TextEditingController();
  final TextEditingController _banknamecontroller = TextEditingController();
  final TextEditingController _bankdesignationcontroller =
      TextEditingController();
  final TextEditingController _banklocationcontroller = TextEditingController();
  final TextEditingController _trainingplatformcontroller =
      TextEditingController();
  final TextEditingController _traininglocationcontroller =
      TextEditingController();
  final TextEditingController _trainingrolecontroller = TextEditingController();
  final TextEditingController _searchaboutcontroller = TextEditingController();
  final TextEditingController _skillsatcontroller = TextEditingController();
  final TextEditingController _searchlocationcontroller =
      TextEditingController();
  final TextEditingController _govtdesignationcontroller =
      TextEditingController();
  final TextEditingController _govtlocationcontroller = TextEditingController();
  final TextEditingController _otheraboutcontroller = TextEditingController();
  final TextEditingController _number1controller = TextEditingController();
  TextEditingController adminnamecontroller = TextEditingController();
  TextEditingController admindesignationcontroller = TextEditingController();
  TextEditingController adminnumcontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();

  List<String> profession = [
    'Industry',
    'Higher Studies',
    'Entrepreneur',
    'Competitive Exams',
    'Trainers',
    'Banking sectors',
    'Searching job',
    'Government job',
    'Other'
  ];

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();

  bool isIndustry = false,
      isStudies = false,
      isbusniess = false,
      isExam = false,
      isTrainer = false,
      isBank = false,
      isSearch = false,
      isHousewife = false,
      isGovt = false,
      isOther = false;

  viewFields(item) {
    if (item == profession[0]) {
      isIndustry = true;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[1]) {
      isIndustry = false;
      isStudies = true;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[2]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = true;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[3]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = true;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[4]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = true;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[5]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = true;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[6]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = true;
      isHousewife = false;
      isGovt = false;
      isOther = false;
    } else if (item == profession[7]) {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = true;
      isOther = false;
    } else {
      isIndustry = false;
      isStudies = false;
      isbusniess = false;
      isExam = false;
      isTrainer = false;
      isBank = false;
      isSearch = false;
      isHousewife = false;
      isGovt = false;
      isOther = true;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _batchController.dispose();
    _branchController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future addIndustryUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String designation,
      String industryname,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'industryname': industryname,
      'location': location,
      'email': email,
      'number': "1",
      'contact': contact
    });
  }

  Future addStudiesUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String highstudycollege,
      String degree,
      String highstudylocation,
      String startdate,
      String enddate,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'higheducation': highstudycollege,
      'degree': degree,
      'higheducationlocation': highstudylocation,
      'start date': startdate,
      'end date': enddate,
      'email': email,
      'number': "2",
      'contact': contact
    });
  }

  Future addBusinessUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String designation,
      String aboutbusiness,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'about business': aboutbusiness,
      'location': location,
      'email': email,
      'number': '3',
      'contact': contact
    });
  }

  Future addExamUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String institute,
      String preparingfor,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'instituteown': institute,
      'preparing for': preparingfor,
      'location': location,
      'email': email,
      'number': '4',
      'contact': contact
    });
  }

  Future addTrainerUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String trainingplatform,
      String trainingrole,
      String traininglocation,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'institute/college': trainingplatform,
      'training role': trainingplatform,
      'training location': traininglocation,
      'email': email,
      'number': '5',
      'contact': contact
    });
  }

  Future addBankUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String bankname,
      String designation,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'bank name': bankname,
      'designation': designation,
      'location': location,
      'email': email,
      'number': '6',
      'contact': contact
    });
  }

  Future addSearchUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String searchfor,
      String skillsat,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'searching for': searchfor,
      'skills at': skillsat,
      'location': location,
      'email': email,
      'number': '7',
      'contact': contact
    });
  }

  Future addGovtUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String designation,
      String location,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'designation': designation,
      'location': location,
      'email': email,
      'number': '8',
      'contact': contact
    });
  }

  Future addIsOtherUserDetails(
      String name,
      String batch,
      String branch,
      String dob,
      String other,
      String email,
      String number,
      String contact) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'batch': batch,
      'branch': branch,
      'dob': dob,
      'other': other,
      'email': email,
      'number': '9',
      'contact': contact
    });
  }

  Future addAdminDetails(String name, String designation, String num) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': name, 'designation': designation, 'number': "10"});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // File? profileimage;
    // final profilepicker = ImagePicker();
    // Future<void> getprofileImage() async {
    //   final pickedfile =
    //       await profilepicker.pickImage(source: ImageSource.gallery);
    //   if (pickedfile != null) {
    //     setState(() {
    //       profileimage = File(pickedfile.path);
    //     });
    //   }
    // }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            'admin1@gmail.com' == emailcontroller.text.trim ||
                    'admin2@gmail.com' == emailcontroller.text.trim
                ? Column(
                    children: [
                      updateTextBox("Name", adminnamecontroller,
                          TextInputType.emailAddress),
                      updateTextBox("Designation", admindesignationcontroller,
                          TextInputType.text),
                      ElevatedButton(
                        onPressed: () {
                          addAdminDetails(
                              adminnamecontroller.text.trim(),
                              admindesignationcontroller.text.trim(),
                              adminnumcontroller.text.trim());
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchPage(),
                              ),
                              (route) => false);
                        },
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 15)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        child: const Text('Save'),
                      ),
                    ],
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: double.infinity,
                        decoration: BoxDecoration(color: primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 60.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Complete your",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 120,
                      //   right: 20,
                      //   left: 20,
                      //   child: Positioned(
                      //     child: Container(
                      //         width: 100,
                      //         height: 100,
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Colors.blue,
                      //             image: DecorationImage(
                      //               image: profileimage != null
                      //                   ? FileImage(profileimage!) as ImageProvider<Object>
                      //                   : const AssetImage('assets/common logo.png'),
                      //               fit: BoxFit.fill,
                      //             ))),
                      //   ),
                      // )
                    ],
                  ),
            const SizedBox(
              height: 70,
            ),
            // ElevatedButton(
            //   onPressed: () => getprofileImage(),
            //   style: ElevatedButton.styleFrom(
            //       foregroundColor: primaryColor,
            //       textStyle: const TextStyle(fontSize: 17),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15))),
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            //     child: Text('Profile Image(Optional)'),
            //   ),
            // ),
            // if (profileimage != null)
            //   Container(
            //       margin: const EdgeInsets.symmetric(vertical: 12),
            //       height: 200,
            //       width: 150,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         image: DecorationImage(
            //           image: FileImage(profileimage!),
            //           fit: BoxFit.cover,
            //         ),
            //       )),
            updateTextBox('Name', _nameController, TextInputType.name),
            updateTextBox('Batch', _batchController, TextInputType.number),
            updateTextBox('Branch', _branchController, TextInputType.name),
            updateTextBox('DOB', _dobController, TextInputType.datetime),
            updateTextBox('Phone no or Personal email ', _phonenumbercontroller,
                TextInputType.emailAddress),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Add your ',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        children: [
                          TextSpan(
                              text: 'Working Experience',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonFormField2(
                alignment: AlignmentDirectional.topStart,
                itemPadding: const EdgeInsets.symmetric(horizontal: 20),
                hint: const Text('Current Status',
                    style: TextStyle(fontSize: 15)),
                icon: const Icon(Icons.arrow_drop_down),
                iconEnabledColor: const Color.fromRGBO(5, 68, 94, 35.0),
                iconDisabledColor: const Color.fromRGBO(217, 217, 217, 1.0),
                buttonHeight: 22,
                isDense: true,
                items: profession
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  viewFields(value);
                },
              ),
            ),
            if (isIndustry)
              Column(
                children: [
                  workTextBox('Designation', _industrydesignationcontroller),
                  workTextBox('Industry Name', _industrynamecontroller),
                  workTextBox('Location', _industrylocationcontroller),
                ],
              ),
            if (isStudies)
              Column(
                children: [
                  workTextBox('College/Institute', _highcollegecontroller),
                  workTextBox('Degree', _degreecontroller),
                  workTextBox('Location', _studylocationcontroller),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    height: 50,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.number,
                      controller: _startdatecontroller,
                      decoration: const InputDecoration(
                          hintText: "Start Date", border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1.0),
                        borderRadius: BorderRadius.circular(12)),
                    height: 50,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.number,
                      controller: _enddatecontroller,
                      decoration: const InputDecoration(
                          hintText: "End Date", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            if (isbusniess)
              Column(
                children: [
                  workTextBox('Designation', _businessdesignationcontroller),
                  workTextBox('About business', _aboutbusinesscontroller),
                  workTextBox('Location', _businesslocationcontroller),
                ],
              ),
            if (isExam)
              Column(
                children: [
                  workTextBox("At Institute Or Own", _instituteowncontroller),
                  workTextBox('Preparing For', _exampreparecontroller),
                  workTextBox('Location', _examlocation)
                ],
              ),
            if (isTrainer)
              Column(
                children: [
                  workTextBox('College/Institute', _trainingplatformcontroller),
                  workTextBox('Training Role', _trainingrolecontroller),
                  workTextBox('Location', _traininglocationcontroller),
                ],
              ),
            if (isBank)
              Column(
                children: [
                  workTextBox('Bank name', _banknamecontroller),
                  workTextBox('Designation', _bankdesignationcontroller),
                  workTextBox('Location', _banklocationcontroller)
                ],
              ),
            if (isSearch)
              Column(
                children: [
                  workTextBox('Searching For', _searchaboutcontroller),
                  workTextBox('Skills', _skillsatcontroller),
                  workTextBox('Location', _searchlocationcontroller)
                ],
              ),
            if (isGovt)
              Column(
                children: [
                  workTextBox('Designation', _govtdesignationcontroller),
                  workTextBox('Location', _govtlocationcontroller)
                ],
              ),
            if (isOther)
              Column(
                children: [workTextBox('About', _otheraboutcontroller)],
              ),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text.trim();
                final String batch = _batchController.text.trim();
                final String branch = _branchController.text.trim();
                final String dob = _dobController.text.trim();
                final String industryname = _industrynamecontroller.text.trim();
                final String industrydesignation =
                    _industrydesignationcontroller.text.trim();
                final String industrylocation =
                    _industrylocationcontroller.text.trim();
                final String startdate = _startdatecontroller.text.trim();
                final String enddate = _enddatecontroller.text.trim();
                final String highcollege = _highcollegecontroller.text.trim();
                final String studylocation =
                    _studylocationcontroller.text.trim();
                final String degree = _degreecontroller.text.trim();
                final String businessdesignation =
                    _businesslocationcontroller.text.trim();
                final String aboutbusiness =
                    _aboutbusinesscontroller.text.trim();
                final String businesslocation =
                    _businesslocationcontroller.text.trim();
                final String instituteown = _instituteowncontroller.text.trim();
                final String examprepare = _exampreparecontroller.text.trim();
                final String examlocation = _examlocation.text.trim();
                final String bankname = _banknamecontroller.text.trim();
                final String bankdesignation =
                    _bankdesignationcontroller.text.trim();
                final String banklocation =
                    _bankdesignationcontroller.text.trim();
                final String trainingplatform =
                    _trainingplatformcontroller.text.trim();
                final String trainingrole = _trainingrolecontroller.text.trim();
                final String traininglocation =
                    _traininglocationcontroller.text.trim();
                final String searchabout = _searchaboutcontroller.text.trim();
                final String searchlocation =
                    _industrylocationcontroller.text.trim();
                final String skills_at = _skillsatcontroller.text.trim();
                final String govtdesignation =
                    _govtdesignationcontroller.text.trim();
                final String govtlocation = _govtlocationcontroller.text.trim();
                final String otherabout = _otheraboutcontroller.text.trim();
                final String _phonenumber = _phonenumbercontroller.text.trim();

                if (isIndustry == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      industryname.isEmpty ||
                      industrydesignation.isEmpty ||
                      industrylocation.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addIndustryUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _industrydesignationcontroller.text.trim(),
                        _industrynamecontroller.text.trim(),
                        _industrylocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isStudies == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      highcollege.isEmpty ||
                      degree.isEmpty ||
                      studylocation.isEmpty ||
                      startdate.isEmpty ||
                      enddate.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addStudiesUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _highcollegecontroller.text.trim(),
                        _degreecontroller.text.trim(),
                        _studylocationcontroller.text.trim(),
                        _startdatecontroller.text.trim(),
                        _enddatecontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isbusniess == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      businesslocation.isEmpty ||
                      businessdesignation.isEmpty ||
                      aboutbusiness.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addBusinessUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _businessdesignationcontroller.text.trim(),
                        _aboutbusinesscontroller.text.trim(),
                        _businesslocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }

                if (isExam == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      instituteown.isEmpty ||
                      examprepare.isEmpty ||
                      examlocation.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addExamUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _instituteowncontroller.text.trim(),
                        _exampreparecontroller.text.trim(),
                        _examlocation.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isTrainer == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      trainingrole.isEmpty ||
                      trainingplatform.isEmpty ||
                      traininglocation.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addTrainerUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _trainingplatformcontroller.text.trim(),
                        _trainingrolecontroller.text.trim(),
                        _traininglocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isBank == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      bankdesignation.isEmpty ||
                      banklocation.isEmpty ||
                      bankname.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addBankUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _banknamecontroller.text.trim(),
                        _bankdesignationcontroller.text.trim(),
                        _banklocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isSearch == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      searchabout.isEmpty ||
                      searchlocation.isEmpty ||
                      skills_at.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addSearchUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _searchaboutcontroller.text.trim(),
                        _skillsatcontroller.text.trim(),
                        _searchlocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }

                if (isGovt == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      govtlocation.isEmpty ||
                      govtdesignation.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addGovtUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _govtdesignationcontroller.text.trim(),
                        _govtlocationcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
                if (isOther == true) {
                  if (name.isEmpty ||
                      batch.isEmpty ||
                      branch.isEmpty ||
                      dob.isEmpty ||
                      otherabout.isEmpty ||
                      _phonenumber.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please Enter All Fields!'),
                      behavior: SnackBarBehavior.floating,
                      elevation: 1,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: primaryColor,
                    ));
                  } else {
                    addIsOtherUserDetails(
                        _nameController.text.trim(),
                        _batchController.text.trim(),
                        _branchController.text.trim(),
                        _dobController.text.trim(),
                        _otheraboutcontroller.text.trim(),
                        emailcontroller.text.trim(),
                        _number1controller.text.trim(),
                        _phonenumbercontroller.text.trim());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                }
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

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
        ),
      ),
    );
  }

  Widget workTextBox(String hint, TextEditingController controller) {
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
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
