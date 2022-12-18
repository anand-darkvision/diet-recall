// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//sanchana bro code-------and pragathi bro....
class Preference extends StatefulWidget {
  const Preference({Key? key}) : super(key: key);
  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  User? user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  int foodtype = -1;
  // 0-veg 1-non-veg
  int smoke = -1;
  // 1-yes 0-no
  int alchohol = -1;
  // 1-yes 0-no

  int highbp = -1;
  int hypertension = -1;
  int diabetes = -1;
  int Cardiovascular = -1;

  int milk = -1;
  int egg = -1;
  int peanut = -1;
  int fish = -1;
  int seasame = -1;
  int nuts = -1;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "South India",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "South India"),
      const DropdownMenuItem(
          child: Text(
            "North India",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "North India"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get tastedropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Sweet",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "Sweet"),
      const DropdownMenuItem(
          child: Text(
            "Sour",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "Sour"),
      const DropdownMenuItem(
          child: Text(
            "Salty",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "Salty"),
      const DropdownMenuItem(
          child: Text(
            "Bitter",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "Bitter"),
      const DropdownMenuItem(
          child: Text(
            "Savory",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          value: "Savory"),
    ];
    return menuItems;
  }

  String selectedValue = "South India";
  String selectedTaste = "Sweet";

  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "PREFENCES",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Food Type:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 0,
                  groupValue: foodtype,
                  onChanged: (value) {
                    setState(() {
                      foodtype = value as int;
                    });
                  },
                ),
                title: const Text(
                  'Veg',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: foodtype,
                  onChanged: (value) {
                    setState(() {
                      foodtype = value as int;
                    });
                  },
                ),
                title: const Text(
                  'Non-Veg',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Do you smoke ?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: smoke,
                  onChanged: (value) {
                    setState(() {
                      smoke = value as int;
                    });
                  },
                ),
                title: const Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 0,
                  groupValue: smoke,
                  onChanged: (value) {
                    setState(() {
                      smoke = value as int;
                    });
                  },
                ),
                title: const Text(
                  'No',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const Text(
                'Do you drink alchol ?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: alchohol,
                  onChanged: (value) {
                    setState(() {
                      alchohol = value as int;
                    });
                  },
                ),
                title: const Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 0,
                  groupValue: alchohol,
                  onChanged: (value) {
                    setState(() {
                      alchohol = value!;
                    });
                  },
                ),
                title: const Text(
                  'No',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Location :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton(
                      value: selectedValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Taste:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton(
                      value: selectedTaste,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue1) {
                        setState(() {
                          selectedTaste = newValue1!;
                        });
                      },
                      items: tastedropdownItems),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'comorbidities: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: highbp,
                  onChanged: (value) {
                    setState(() {
                      highbp = value as int;
                    });
                  },
                ),
                title: const Text(
                  'High BP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: hypertension,
                  onChanged: (value) {
                    setState(() {
                      hypertension = value!;
                    });
                  },
                ),
                title: const Text(
                  'Hyper Tension',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: diabetes,
                  onChanged: (value) {
                    setState(() {
                      diabetes = value!;
                    });
                  },
                ),
                title: const Text(
                  'Diabetes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: Cardiovascular,
                  onChanged: (value) {
                    setState(() {
                      Cardiovascular = value!;
                    });
                  },
                ),
                title: const Text(
                  'Cardiovascular Disease',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const Text(
                'Allergies: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: milk,
                  onChanged: (value) {
                    setState(() {
                      milk = value!;
                    });
                  },
                ),
                title: const Text(
                  'Dairy allergies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: fish,
                  onChanged: (value) {
                    setState(() {
                      fish = value!;
                    });
                  },
                ),
                title: const Text(
                  'Fish allergies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ListTile(
                leading: Radio<int>(
                  value: 1,
                  groupValue: nuts,
                  onChanged: (value) {
                    setState(() {
                      nuts = value!;
                    });
                  },
                ),
                title: const Text(
                  'Tree nuts allergies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 50),
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 58, 62, 89),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: 300,
                        onPressed: () async {
                          String foodty = '',
                              smok = '',
                              alo = '',
                              highb = '',
                              hyperten = '',
                              diabe = '',
                              cardi = '',
                              mil = '',
                              eg = '',
                              pea = '',
                              fi = '',
                              sea = '',
                              nut = '';
                          if (foodtype == 0) {
                            setState(() {
                              foodty = "veg";
                            });
                          } else if (foodtype == 1) {
                            setState(() {
                              foodty = "NonVeg";
                            });
                          } else {
                            foodty = "Not Prefered";
                          }
                          if (smoke == 0) {
                            setState(() {
                              smok = "No";
                            });
                          } else if (smoke == 1) {
                            setState(() {
                              smok = "Yes";
                            });
                          } else {
                            smok = "Not Prefered";
                          }
                          if (alchohol == 0) {
                            setState(() {
                              alo = "No";
                            });
                          } else if (alchohol == 1) {
                            setState(() {
                              alo = "Yes";
                            });
                          } else {
                            alo = "Not Prefered";
                          }
                          if (highbp == 1) {
                            setState(() {
                              highb = "HighBP";
                            });
                          } else {
                            highb = "Not Prefered";
                          }
                          if (hypertension == 1) {
                            setState(() {
                              hyperten = "HyperTension";
                            });
                          } else {
                            hyperten = "Not Prefered";
                          }
                          if (diabetes == 1) {
                            setState(() {
                              diabe = "Diabetes";
                            });
                          } else {
                            diabe = "Not Prefered";
                          }
                          if (Cardiovascular == 1) {
                            setState(() {
                              cardi = "Cardiovascular";
                            });
                          } else {
                            cardi = "Not Prefered";
                          }
                          if (milk == 1) {
                            setState(() {
                              mil = "Milk Allergies";
                            });
                          } else {
                            mil = "Not Prefered";
                          }
                          if (fish == 1) {
                            setState(() {
                              fi = "Fish Allergies";
                            });
                          } else {
                            fi = "Not Prefered";
                          }
                          if (nuts == 1) {
                            setState(() {
                              nut = "Nuts Allergies";
                            });
                          } else {
                            nut = "Not Prefered";
                          }
                          await Firestore.collection('users')
                              .doc(user?.uid)
                              .collection('preference')
                              .doc(user?.uid)
                              // ignore: equal_keys_in_map
                              .set({
                            'Foodtype': foodty,
                            'Smoking': smok,
                            'Alcohol': alo,
                            'HighBp': highb,
                            'HyperTension': hyperten,
                            'Diabetes': diabe,
                            'Cardiovascular': cardi,
                            'Milk': mil,
                            'Fish': fi,
                            'Nuts': nut,
                            'Locations': selectedValue,
                            'Taste': selectedTaste
                          }, SetOptions(merge: true));
                          setState(() {
                            int foodtype = -1;
                            // 0-veg 1-non-veg
                            smoke = -1;
                            // 1-yes 0-no
                            alchohol = -1;
                            // 1-yes 0-no

                            highbp = -1;
                            hypertension = -1;
                            diabetes = -1;
                            Cardiovascular = -1;

                            milk = -1;

                            fish = -1;

                            nuts = -1;
                          });
                          await Hive.openBox("recall");
                          await Hive.openBox("morningSnack");
                          await Hive.openBox("lunch");
                          await Hive.openBox("evening");
                          await Hive.openBox("dinner");
                          await Hive.openBox("vatpit");
                          await Hive.openBox("bodytype");
                          await Hive.openBox("vatafood");
                          await Hive.openBox("water");
                          await Hive.openBox("point");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: const Text(
                          "FINISH",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // throw UnimplementedError();
}
