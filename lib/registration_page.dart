// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:vehicle_registration_checker/license_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registrationPage extends StatefulWidget {
  const registrationPage({ Key? key }) : super(key: key);

  @override
  State<registrationPage> createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
    final registrationInputController = TextEditingController();

    // ----------------
Future createRegistration({required String license}) async {
    
      final docUser = FirebaseFirestore.instance.collection('registered-numbers').doc();

      final licenseNumber = License(
          id: docUser.id,
          license: license,
        );

        final json = licenseNumber.toJson();

        await docUser.set(json);
    }

    validatingInput (license) {
        String registrationInput = registrationInputController.text.replaceAll(RegExp(r"\s+\b|\b\s"), "");
        registrationInput =registrationInput.toUpperCase();
        int licenseLength = registrationInput.length;

        if (licenseLength == 7 ) {
            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog(
                            title:  const Center(
                                child: Text("Old License")
                            ),
                            content: Text('"'+registrationInput+'"'+" is now registered.")
                        );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a valid license number.")
                    );
                });
            }
        } else if (licenseLength == 8) {

            String sectionOne = registrationInput.substring(0,3);
            String sectionTwo = registrationInput.substring(3,4);
            String sectionThree = registrationInput.substring(4,8);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);

                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("Old License")),
                        content: Text('"'+registrationInput+'"'+" is now registered.")
                    );
                });
            } else {
                if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                    createRegistration(license: license);
                    showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+registrationInput+'"'+" is now registered.")
                    );
                });
                } else {
                    showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a valid license number.")
                    );
                });
                }
            }
        } else
        //  9 digit license plate validation
        if (licenseLength == 9) {

            if (registrationInput.contains(RegExp(r"^[a-zA-Z]+[P]+[a-zA-Z]+[a-zA-Z]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+registrationInput+'"'+" is now registered.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a valid license number.")
                    );
                });
            }
        } else { }

        //  10 digit vintage license plate validation
        if (licenseLength == 10) {
            String sectionOne = registrationInput.substring(0,2);
            String characterSpecail = registrationInput.substring(2,6);
            String sectionThree = registrationInput.substring(6,10);

            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[SHRI]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                characterSpecail = characterSpecail.replaceAll("SHRI", "ශ්‍රී");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("Vintage License")),
                        content: Text('"'+sectionOne+characterSpecail+sectionThree+'"'+"is now registered.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a valid license number.")
                    );
                });
            }
        } else { 
            showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a valid license number.\n Please check the format.")
                    );
                });
        }
    }


    // final	formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text (
          "Registration Validation",
          style: TextStyle (
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),

    body: Container (
        alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Text("If the number contains 'xxශ්‍රීxxxx' type it as 'xxSHRIxxxx'. "),
                    Form (
                        child: Column (
                            children: [
                                TextFormField (
                                    controller: registrationInputController,
                                    decoration: const InputDecoration (
                                        hintText: "License number here."
                                    ),
                                ),
                                
                                SizedBox.fromSize(
                                    size: const Size(56, 56), // button width and height
                                    child: ClipOval (
                                        child: Material (
                                            color: Colors.green[700], // button color
                                            child: InkWell (
                                                splashColor: Colors.green[400], // splash color
                                                onTap: () {
                                                    final license = registrationInputController.text;
                                                    validatingInput(license);
                                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                                    if ( !currentFocus.hasPrimaryFocus ) {
                                                        currentFocus.unfocus();
                                                    }
                                                    registrationInputController.clear();
                                                }, // button pressed
                                                child: Column (
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: const <Widget>[
                                                        Icon(Icons.add_circle_outline_rounded), // icon
                                                        Text("Add "), // text
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ),
                                )
                            ]
                        ),
                    ),
                    const SizedBox( height : 25.0),
                ],
            ),
        ),
    );
}
}