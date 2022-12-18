import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  List _items = [];
  List _display = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/csvjson.json');
    final data = await json.decode(response);

    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    readJson();
    setState(() {
      _display = _items;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            label: const Text("")),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        title: Text(
          "${t?.nutri}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _display.length + 1,
                itemBuilder: (context, index) {
                  return index == 0 ? _searchBar() : _listmat(index - 1);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _searchBar() {
    var t = AppLocalizations.of(context);
    return Column(
      children: <Widget>[
        TextFormField(
          cursorColor: Colors.black,
          autofocus: false,
          keyboardType: TextInputType.text,
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              _display = _items.where((note) {
                var foodcat = note["Description"].toLowerCase();
                return foodcat.contains(text);
              }).toList();
            });
          },
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
            hintText: t?.foodname,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                color: Colors.black,
                width: 20,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 300,
          child: Center(
            child: Text(
              "${t?.typeanssearch}",
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _listmat(index) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  _display[index]["Description"].toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                "Cholesterol : ${_display[index]["Data.Cholesterol"].toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                "Carbohydrate : ${_display[index]["Data.Carbohydrate"].toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                "Protein : ${_display[index]["Data.Protein"].toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                "Fiber : ${_display[index]["Data.Fiber"].toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 10),
              Text(
                "Sugar : ${_display[index]["Data.Sugar Total"].toString()}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
