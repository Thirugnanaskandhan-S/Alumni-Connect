import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditWorkTab extends StatefulWidget {
  const EditWorkTab({super.key});

  @override
  State<EditWorkTab> createState() => _EditWorkTabState();
}

class _EditWorkTabState extends State<EditWorkTab> {
  
  TextEditingController editnameController = TextEditingController();
  TextEditingController editbatchController = TextEditingController();
  TextEditingController editbranchController = TextEditingController();
  TextEditingController editdobController = TextEditingController();
  TextEditingController editdesignationcontroller = TextEditingController();
  TextEditingController editnamecontroller = TextEditingController();
  TextEditingController editlocationcontroller = TextEditingController();
  TextEditingController editdegreecontroller = TextEditingController();
  TextEditingController editaboutcontroller = TextEditingController();
  final List<String> editprofession = [
    'Industry',
    'Higher Studies',
    'Entrepreneur',
    'Competative exams',
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
    if (item == editprofession[0]) {
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
    } else if (item == editprofession[1]) {
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
    } else if (item == editprofession[2]) {
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
    } else if (item == editprofession[3]) {
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
    } else if (item == editprofession[4]) {
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
    } else if (item == editprofession[5]) {
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
    } else if (item == editprofession[6]) {
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
    } else if (item == editprofession[7]) {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Text("Cannot Edit")
      //     Padding(
      //       padding: const EdgeInsets.all(18.0),
      //       child: Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      //         margin: const EdgeInsets.symmetric(vertical: 7),
      //         width: size.width * 0.8,
      //         decoration: BoxDecoration(
      //             color: const Color.fromRGBO(217, 217, 217, 1.0),
      //             borderRadius: BorderRadius.circular(12)),
      //         child: DropdownButtonFormField2(
      //           hint: const Text('Current Status', style: TextStyle(fontSize: 15)),
      //           icon: const Icon(Icons.arrow_drop_down),
      //           iconEnabledColor:const  Color.fromRGBO(5, 68, 94, 35.0),
      //           iconDisabledColor:const  Color.fromRGBO(217, 217, 217, 1.0),
      //           buttonHeight: 22,
      //           isDense: true,
      //           items: editprofession
      //               .map((e) => DropdownMenuItem<String>(
      //                     value: e,
      //                     child: Text(
      //                       e,
      //                       style: const TextStyle(fontSize: 14),
      //                     ),
      //                   ))
      //               .toList(),
      //           onChanged: (value) {
      //             viewFields(value);
      //           },
      //         ),
      //       ),
      //     ),
      //     if (isIndustry)
      //       Column(
      //         children: [
      //           editWorkTextBox('Designation', editdesignationcontroller),
      //           editWorkTextBox('Industry Name', editnamecontroller),
      //           editWorkTextBox(' Location', editlocationcontroller),
      //         ],
      //       ),
      //     if (isStudies)
      //       Column(
      //         children: [
      //           editWorkTextBox('Collage/institute', editnamecontroller),
      //           editWorkTextBox('Location', editlocationcontroller),
      //           editWorkTextBox('Degree', editdegreecontroller),
      //         ],
      //       ),
      //     if (isbusniess)
      //       Column(
      //         children: [
      //           editWorkTextBox('About business', editaboutcontroller),
      //           editWorkTextBox('location', editlocationcontroller)
      //         ],
      //       ),
      //     if (isExam)
      //       Column(
      //         children: [
      //           editWorkTextBox('Institute name', editnamecontroller),
      //           editWorkTextBox('Degree', editdegreecontroller),
      //           editWorkTextBox('location', editlocationcontroller)
      //         ],
      //       ),
      //     if (isTrainer)
      //       Column(
      //         children: [
      //           editWorkTextBox('Working at', editnamecontroller),
      //           editWorkTextBox('Location', editlocationcontroller),
      //           editWorkTextBox('Designation', editdesignationcontroller)
      //         ],
      //       ),
      //     if (isBank)
      //       Column(
      //         children: [
      //           editWorkTextBox('Institute name', editnamecontroller),
      //           editWorkTextBox('Designation', editdesignationcontroller),
      //           editWorkTextBox('Location', editlocationcontroller)
      //         ],
      //       ),
      //     if (isSearch)
      //       Column(
      //         children: [
      //           editWorkTextBox('About business', editaboutcontroller),
      //           editWorkTextBox('Location', editlocationcontroller)
      //         ],
      //       ),
      //     if (isHousewife)
      //       Column(
      //         children: [
      //           editWorkTextBox('About', editaboutcontroller),
      //         ],
      //       ),
      //     if (isGovt)
      //       Column(
      //         children: [
      //           editWorkTextBox('Designation', editdesignationcontroller),
      //           editWorkTextBox('Location', editlocationcontroller)
      //         ],
      //       ),
      //     if (isOther)
      //       Column(
      //         children: [editWorkTextBox('About', editaboutcontroller)],
      //       ),
      //   ],
      // ),
        ]
      )
    );
  }

  Widget editWorkTextBox(String hint, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color:const  Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
      height: 50,
    );
  }
}
