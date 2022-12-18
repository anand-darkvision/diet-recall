// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/providers/user_model.dart';
import 'package:dietrecallapp/screens/homepage.dart';
import 'package:dietrecallapp/usermodel/bodytype.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser!;

  final pdf = pw.Document();

  void createbox() async {
    Box contactsBox = await Hive.openBox('bodytype');
  }

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    createbox();
    super.initState();
  }

  firstName() {
    if ("${loggedInUser.firstName}".endsWith("null")) {
      return "${user?.displayName}";
    } else {
      return "${loggedInUser.firstName}";
    }
  }

  email() {
    if ("${loggedInUser.email}".endsWith("null")) {
      return "${user?.email}";
    } else {
      return "${loggedInUser.email}";
    }
  }

  final contactBox = Hive.box('dinner');
  final contactBox1 = Hive.box("recall");
  final contactBox2 = Hive.box("morningSnack");
  final contactBox3 = Hive.box("lunch");
  final contactBox4 = Hive.box("evening");

  getbreakfast() async {}

  String stf() {
    Hive.openBox("bodytype");
    String res = '';
    Box contactsBox = Hive.box('bodytype');

    if (contactsBox.isEmpty) {
      setState(() {
        res = 'No data Found In DataBase';
      });
    } else {
      final contact_break = contactsBox.getAt(0) as bodytype_Contact;
      var bad_list = contact_break.bodyt;
      for (int i = 0; i <= 5; i++) {
        if (bad_list[i] == 1.0) {
          if (i == 0) {
            setState(() {
              res = 'vata';
            });
          } else if (i == 1) {
            setState(() {
              res = 'pitta';
            });
          } else if (i == 2) {
            setState(() {
              res = 'kapha';
            });
          } else if (i == 3) {
            setState(() {
              res = 'vata And pitta';
            });
          } else if (i == 4) {
            setState(() {
              res = 'vata And kapha';
            });
          } else {
            setState(() {
              res = 'pitta And kapha';
            });
          }
        }
      }
    }
    return res;
  }

  writeOnPdf() {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String name = firstName();
    String emaip = email();
    String boty = stf();
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a5,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
              level: 0,
              child: pw.Text(
                "Diet Report",
              )),
          pw.Paragraph(
              text:
                  "Name : $name                                  Date :$cdate"),
          pw.Paragraph(text: "Email-ID : $emaip"),
          pw.Paragraph(text: "BodyType: $boty"),
          pw.Header(level: 1, child: pw.Text("\n")),
          pw.Paragraph(text: "Prefered Food Menu : South Indian"),
          pw.Paragraph(text: "Taste: Sour "),
          pw.Paragraph(text: "Whether you smoke : No"),
          pw.Paragraph(text: "Whether you Drink(Alchol) : No"),
          pw.Paragraph(text: "High Blood Pressure : No"),
          pw.Paragraph(text: "Hyper Tension : No"),
          pw.Paragraph(text: "Diabetes : Yes"),
          pw.Paragraph(text: "Cardiovascular : yes"),
          pw.Paragraph(
              text:
                  "--------------------------------------------------------------------------------"),
          pw.Paragraph(text: "Allergies"),
          pw.Paragraph(
              text:
                  "--------------------------------------------------------------------------------"),
          pw.Paragraph(text: "Milk Allergies: No"),
          pw.Paragraph(text: "Nuts Allergies: No"),
          pw.Paragraph(text: "Fish Allergies: yes"),
          pw.Paragraph(
              text:
                  "--------------------------------------------------------------------------------"),
          pw.Paragraph(text: "Percentages"), //kapha -6,5,-7
          pw.Paragraph(text: "Kapha : 27%"),
          pw.Paragraph(text: "Vata  : 37%"),
          pw.Paragraph(text: "Pitta : 36%"),

          pw.Paragraph(
              text:
                  "--------------------------------------------------------------------------------"),
        ];
      },
    ));
  }

  Future savePdf() async {
    File file = File("/storage/emulated/0/Download/report.pdf");

    file.writeAsBytesSync(List.from(await pdf.save()));
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        title: Text(
          "${t?.reportpage}",
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 600,
            width: 370,
            color: Colors.black12,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 600,
                    width: 370,
                    child: File("/storage/emulated/0/Download/report.pdf")
                            .existsSync()
                        ? SfPdfViewer.file(
                            File("/storage/emulated/0/Download/report.pdf"))
                        : Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 340,
                                height: 400,
                                child: Image.asset("assets/images/404.gif"),
                              ),
                              Text(
                                "${t?.downloadtoview}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: "Sharetech",
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 58, 62, 89),
                child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 50,
                    onPressed: () async {
                      await writeOnPdf();
                      await savePdf();
                      setState(() {});
                    },
                    child: Text(
                      "${t?.downloadrepo}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Sharetech"),
                    )),
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 58, 62, 89),
                child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 50,
                    onPressed: () async {
                      File file =
                          File("/storage/emulated/0/Download/report.pdf");
                      await file.delete();
                      setState(() {});
                    },
                    child: Text(
                      "${t?.deleterepo}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Sharetech"),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
