// import 'dart:async';
// import 'package:dietrecallapp/screens/homepage.dart';
// import 'package:dietrecallapp/screens/plan_2.dart';
// import 'package:flutter/material.dart';
//
// class Plan extends StatefulWidget {
//   const Plan({Key? key}) : super(key: key);
//
//   @override
//   State<Plan> createState() => _PlanState();
// }
//
// TextEditingController _height = TextEditingController();
// TextEditingController _weight = TextEditingController();
// TextEditingController _age = TextEditingController();
// TextEditingController _goal = TextEditingController();
//
// class _PlanState extends State<Plan> {
//   final heightField = TextFormField(
//     cursorColor: Colors.black,
//     autofocus: false,
//     controller: _height,
//     keyboardType: TextInputType.number,
//     textInputAction: TextInputAction.next,
//     decoration: InputDecoration(
//       fillColor: Colors.white,
//       filled: true,
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           width: 2,
//           color: Colors.black,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       focusColor: Colors.black,
//       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//       hintText: "cms",
//       border: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           color: Colors.black,
//           width: 20,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//   );
//
//   final ageField = TextFormField(
//     cursorColor: Colors.black,
//     autofocus: false,
//     controller: _age,
//     keyboardType: TextInputType.number,
//     textInputAction: TextInputAction.next,
//     decoration: InputDecoration(
//       fillColor: Colors.white,
//       filled: true,
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           width: 2,
//           color: Colors.black,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       focusColor: Colors.black,
//       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//       hintText: "age",
//       border: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           color: Colors.black,
//           width: 20,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//   );
//
//   final weightField = TextFormField(
//     cursorColor: Colors.black,
//     autofocus: false,
//     controller: _weight,
//     keyboardType: TextInputType.number,
//     textInputAction: TextInputAction.next,
//     decoration: InputDecoration(
//       fillColor: Colors.white,
//       filled: true,
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           width: 2,
//           color: Colors.black,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       focusColor: Colors.black,
//       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//       hintText: "kgs",
//       border: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           color: Colors.black,
//           width: 20,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//   );
//   final goalField = TextFormField(
//     cursorColor: Colors.black,
//     autofocus: false,
//     controller: _goal,
//     keyboardType: TextInputType.number,
//     textInputAction: TextInputAction.next,
//     decoration: InputDecoration(
//       fillColor: Colors.white,
//       filled: true,
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           width: 2,
//           color: Colors.black,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       focusColor: Colors.black,
//       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//       hintText: "kgs",
//       border: OutlineInputBorder(
//         borderSide: const BorderSide(
//           style: BorderStyle.solid,
//           color: Colors.black,
//           width: 20,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     ),
//   );
//
//   bool value = false;
//   int val = -1;
//
//   bool a_value = false;
//   int val_n = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     double bmiCal(double height, double weight) {
//       // ignore: non_constant_identifier_names
//       double finalresult = weight / (height * height / 10000);
//       double bmi = finalresult;
//       return bmi;
//     }
//
//     void clearfun() {
//       _height.clear();
//       _weight.clear();
//       _age.clear();
//       _goal.clear();
//     }
//
//     final submitDietButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: const Color.fromARGB(255, 58, 62, 89),
//       child: MaterialButton(
//           padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: 300,
//           onPressed: () {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => const PlanPage()));
//             Timer(const Duration(seconds: 1), clearfun);
//           },
//           child: const Text(
//             "Find Your Body Type",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
//           )),
//     );
//     //
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: TextButton.icon(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => const HomePage()));
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             label: const Text("")),
//         backgroundColor: const Color.fromARGB(255, 168, 184, 139),
//         title: const Text(
//           "DIET PLANNER",
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.black,
//             fontFamily: "Roboto",
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 40),
//             Row(
//               children: const <Widget>[
//                 SizedBox(width: 50),
//                 Text(
//                   "Height",
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 SizedBox(width: 40),
//                 Text(
//                   "Weight",
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 SizedBox(width: 60),
//                 Text(
//                   "Age",
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: <Widget>[
//                 const SizedBox(width: 35),
//                 SizedBox(
//                   child: heightField,
//                   width: 90,
//                   height: 50,
//                 ),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                   child: weightField,
//                   width: 90,
//                   height: 50,
//                 ),
//                 const SizedBox(width: 20),
//                 SizedBox(
//                   child: ageField,
//                   width: 90,
//                   height: 50,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(children: const <Widget>[
//               SizedBox(width: 30),
//               Text(
//                 "Gender",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "*",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//             ]),
//             const SizedBox(height: 0),
//             ListTile(
//               title: const Text(
//                 "Male",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: Radio(
//                 value: 1,
//                 groupValue: val,
//                 onChanged: (value) {
//                   setState(() {
//                     val = value as int;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             ListTile(
//               title: const Text(
//                 "Female",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: Radio(
//                 value: 2,
//                 groupValue: val,
//                 onChanged: (value) {
//                   setState(() {
//                     val = value as int;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             ListTile(
//               title: const Text(
//                 "Others",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: Radio(
//                 value: 3,
//                 groupValue: val,
//                 onChanged: (value) {
//                   setState(() {
//                     val = value as int;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: const <Widget>[
//                 SizedBox(width: 30),
//                 Text(
//                   "Goal Weight",
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(children: <Widget>[
//               const SizedBox(width: 30),
//               SizedBox(
//                 child: goalField,
//                 height: 50,
//                 width: 100,
//               ),
//             ]),
//             const SizedBox(height: 20),
//             Row(children: const <Widget>[
//               SizedBox(width: 30),
//               Text(
//                 "Diet Preference",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "*",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//             ]),
//             const SizedBox(height: 10),
//             ListTile(
//               title: const Text(
//                 "Veg",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: Radio(
//                 value: 1,
//                 groupValue: val_n,
//                 onChanged: (a_value) {
//                   setState(() {
//                     val_n = a_value as int;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             ListTile(
//               title: const Text(
//                 "Non Veg",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: Radio(
//                 value: 2,
//                 groupValue: val_n,
//                 onChanged: (a_value) {
//                   setState(() {
//                     val_n = a_value as int;
//                   });
//                 },
//                 activeColor: Colors.green,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: SizedBox(
//                 child: submitDietButton,
//                 height: 60,
//                 width: 200,
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
