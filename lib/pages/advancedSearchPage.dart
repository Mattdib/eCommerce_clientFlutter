import 'package:app_progetto/models/model.dart';
import 'package:app_progetto/models/formInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_inputField.dart';

class AdvancedSearch extends StatefulWidget {
  AdvancedSearch() : super();


  @override
  State<AdvancedSearch> createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {

  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController minpriceTextController = TextEditingController();
  TextEditingController maxpriceTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Advanced Search Page", style: GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold))
      ),
      drawer: MyDrawer(),
      //form where the user input all the info:
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [
                  InputField(
                    labelText: "Name:",
                    controller: nameTextController,
                  ),
                  InputField(
                    labelText: "Description:",
                    controller: descriptionTextController,
                  ),
                  InputField(
                    labelText: "min price:",
                    controller: minpriceTextController,
                  ),
                  InputField(
                    labelText: "max price:",
                    controller: maxpriceTextController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: search,
        label: Text("research", style: GoogleFonts.dmSerifDisplay(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
      ),
    );
  }


  void search() {
    final form= context.read<FormInfo>();
    form.setName(nameTextController.text);
    form.setDescription(descriptionTextController.text);
    form.setmin(minpriceTextController.text);
    form.setmax(maxpriceTextController.text);
    Navigator.pushNamed(context, '/resultPage');
  }


}