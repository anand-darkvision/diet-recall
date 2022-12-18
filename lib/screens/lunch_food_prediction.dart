import 'dart:io';

import 'package:dietrecallapp/Dataset/lunch_dataset.dart';
import 'package:dietrecallapp/Nutrition_screen/lunch.dart';
import 'package:dietrecallapp/usermodel/lunch_user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class LunchFoodPrediction extends StatefulWidget {
  const LunchFoodPrediction({Key? key}) : super(key: key);

  @override
  State<LunchFoodPrediction> createState() => _LunchFoodPredictionState();
}

class _LunchFoodPredictionState extends State<LunchFoodPrediction> {
  String servings = '';
  final TextEditingController _serving = TextEditingController();

  late File _image;
  late List _results = [];
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final servingsField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _serving,
      onChanged: (text) {
        servings = text;
      },
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "servings",
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
            width: 20,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    var b1 = Lunch_dataset().getlunch();
    var b2 = Lunch_dataset().getlunchcal();
    var b3 = Lunch_dataset().getlunchpro();
    var b4 = Lunch_dataset().getfoodcarbs();
    var b5 = Lunch_dataset().getfoodfats();

    dynamic fg, predictedName, newcal, newpro, newcarbs, newfat;

    dynamic max = (imageSelect) ? _results.first : null;

    (imageSelect)
        ? _results.map((result) {
            for (var e in _results) {
              if (e['confidence'] > max['confidence']) max = e;
            }
            fg = max['label'];

            print("name:$fg");

            dynamic h = fg.split(' ');

            String r = h[1];
            // debugPrint(r);

            for (int i = 1; i <= 23; i++) {
              if (r == b1[i]) {
                setState(() {
                  predictedName = b1[i];
                  newcal = b2[i];
                  newpro = b3[i];
                  newcarbs = b4[i];
                  newfat = b5[i];
                });
              }
            }
            return Container();
          }).toList()
        : null;

    void addFood(lunch_Contact contact) {
      final contactBox = Hive.box('lunch');
      contactBox.add(contact);
    }

    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Lunch()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            label: const Text("")),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        title: const Text(
          "FOOD SCANNER",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  width: 200,
                  height: 250,
                  margin: const EdgeInsets.all(10),
                  child: Image.file(_image),
                )
              : Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 190,
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Card(
                      elevation: 4,
                      child: Center(
                        child: Text(
                          "No image selected",
                          style: TextStyle(
                            fontFamily: "sharetech",
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 300,
                          height: 210,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 23),
                                Text(
                                  "Name :  $predictedName",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Calorie Content  : $newcal",
                                  style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Protien Content  : $newpro",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Carbohydrate Content : $newcarbs",
                                  style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Fat Content : $newfat",
                                  style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 23),
                      Row(
                        children: const <Widget>[
                          SizedBox(width: 150),
                          Text(
                            "Servings",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 140),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: servingsField,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 58, 62, 89),
                        child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: 200,
                            onPressed: () async {
                              Hive.openBox("recall");
                              final newContact = lunch_Contact(
                                  (predictedName == null) ? "0" : predictedName,
                                  (_serving.text.toString().contains('null'))
                                      ? int.parse('0')
                                      : int.parse(_serving.text),
                                  "0",
                                  0);
                              addFood(newContact);
                              _serving.clear();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Lunch()));
                            },
                            child: const Text(
                              "Add",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: "Sharetech"),
                            )),
                      ),
                    ]
                  : [],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.camera_alt_rounded),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // final XFile? pickedFile = await _picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    var source = ImageSource.camera;
    final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);

    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
