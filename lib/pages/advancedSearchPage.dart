import 'package:app_progetto/models/formInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
  String dropDownSelected = "0";

  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController minpriceTextController = TextEditingController();
  TextEditingController maxpriceTextController = TextEditingController();

  //FrontEnd:

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
                  //Bottom to choose the type of the Product:
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        //add all the types of Product:
                        DropdownButtonFormField(
                            value: dropDownSelected,
                            items: const [
                              DropdownMenuItem(
                                  value: "0",
                                  child: Text("NONE")
                              ),
                              DropdownMenuItem(
                                value: "1",
                                child: Text("SHOES")
                              ),
                              DropdownMenuItem(
                                  value: "2",
                                  child: Text("CONSOLE")
                              ),
                              DropdownMenuItem(
                                  value: "3",
                                  child: Text("CAMERA")
                              ),
                              DropdownMenuItem(
                                  value: "4",
                                  child: Text("PC")
                              ),
                              DropdownMenuItem(
                                  value: "5",
                                  child: Text("SMARTPHONE")
                              ),
                              DropdownMenuItem(
                                  value: "6",
                                  child: Text("HEADPHONE")
                              ),
                              DropdownMenuItem(
                                  value: "7",
                                  child: Text("WATCH")
                              ),
                              DropdownMenuItem(
                                  value: "8",
                                  child: Text("KEYBOARD")
                              ),
                            ],
                            onChanged: (String? value){
                              setState(() {
                                dropDownSelected = value!;
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down),
                            decoration:  const InputDecoration(
                              labelText: "Type:",
                              border: OutlineInputBorder()
                            ),
                        ),
                      ],
                    ),
                  )
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

  //BackEnd:


  void search() {
    final form= context.read<FormInfo>();
    form.setName(nameTextController.text);
    form.setDescription(descriptionTextController.text);
    form.setmin(minpriceTextController.text);
    form.setmax(maxpriceTextController.text);
    form.setType(dropDownSelected);
    Navigator.pushNamed(context, '/resultPage');
  }


}