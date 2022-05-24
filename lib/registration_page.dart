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

    // Method to create add numbers to Database
    Future createRegistration({required String license}) async {
        
        final docLicense = FirebaseFirestore.instance.collection('registered-numbers').doc();

        final licenseNumber = License (
            id: docLicense.id,
            license: license,
        );

        final json = licenseNumber.toJson();

        await docLicense.set(json);
    }

    // Validation of License Number input by user, similar to checker_page.dart
    validatingInput (license) {
        String registrationInput = registrationInputController.text.replaceAll(RegExp(r"\s+\b|\b\s"), "");
        registrationInput =registrationInput.toUpperCase();
        int licenseLength = registrationInput.length;

        if (licenseLength == 7 ) {
            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog (
                        title:  const Center (
                                child: Text("Old License Registered")
                            ),  
                            content : Stack (alignment: Alignment.center, 
                            children : <Widget> [
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left : 65.0, bottom: 20),
                                        child: Row (
                                          children: [
                                            Image.asset(
                                                'assets/old.png',
                                                height: 80,
                                            ), 
                                          ],
                                        ),
                                      ),
                                      Text('"'+registrationInput+'"'+" is now registered")
                                    ],
                                  ),
                            ]
                        )
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
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Old License Registered")
                            ),  
                            content : Stack (alignment: Alignment.center, 
                            children : <Widget> [
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left : 65.0, bottom: 20),
                                        child: Row (
                                          children: [
                                            Image.asset(
                                                'assets/old.png',
                                                height: 80,
                                            ), 
                                          ],
                                        ),
                                      ),
                                      Text('"'+registrationInput+'"'+" is now registered")
                                    ],
                                  ),
                            ]
                        )
                    );
                });
            } else {
                if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                    createRegistration(license: license);
                    showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Modern License Registered")
                            ),  
                            content : Stack (alignment: Alignment.center, 
                            children : <Widget> [
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left : 65.0, bottom: 20),
                                        child: Row (
                                          children: [
                                            Image.asset(
                                                'assets/modern.png',
                                                height: 80,
                                            ), 
                                          ],
                                        ),
                                      ),
                                      Text('"'+registrationInput+'"'+" is now registered")
                                    ],
                                  ),
                            ]
                        )
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
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Modern License Registered")
                            ),  
                            content : Stack (alignment: Alignment.center, 
                            children : <Widget> [
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left : 65.0, bottom: 20),
                                        child: Row (
                                          children: [
                                            Image.asset(
                                                'assets/modern.png',
                                                height: 80,
                                            ), 
                                          ],
                                        ),
                                      ),
                                      Text('"'+registrationInput+'"'+" is now registered")
                                    ],
                                  ),
                            ]
                        )
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
        } else 

        //  10 digit vintage license plate validation
        if (licenseLength == 10) {
            String sectionOne = registrationInput.substring(0,2);
            String characterSpecial = registrationInput.substring(2,6);
            String sectionThree = registrationInput.substring(6,10);

            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[SHRI]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                characterSpecial = characterSpecial.replaceAll("SHRI", "ශ්‍රී");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Vintage License Registered")
                            ),  
                            content : Stack (alignment: Alignment.center, 
                            children : <Widget> [
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left : 65.0, bottom: 20),
                                        child: Row (
                                          children: [
                                            Image.asset(
                                                'assets/vintage.png',
                                                height: 80,
                                            ), 
                                          ],
                                        ),
                                      ),
                                      Text('"'+sectionOne+characterSpecial+sectionThree+'"'+" is now registered")
                                    ],
                                  ),
                            ]
                        )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          toolbarHeight: 70,
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
        decoration: const BoxDecoration (
            gradient: LinearGradient (
              begin: Alignment.topLeft,
              end: Alignment.bottomRight, 
              colors: [
                    Color.fromARGB(226, 214, 232, 223),
                    Color.fromARGB(194, 253, 253, 253),
                ],
            )
        ),
        alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Text("If the license contains 'xxශ්‍රීxxxx' type it as 'xxSHRIxxxx'. "),
                    const SizedBox(height: 20,),
                    Form (
                        child: Column (
                            children: [
                                TextFormField (
                                    controller: registrationInputController,
                                    decoration: const InputDecoration (
                                        hintText: "License number here."
                                    ),
                                ),
                                const SizedBox(height: 20,),
                                GestureDetector(
                                onTap: () {
                                final license = registrationInputController.text;
                                validatingInput(license);
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if ( !currentFocus.hasPrimaryFocus ) {
                                    currentFocus.unfocus();
                                }
                                registrationInputController.clear();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient (
                                        colors:  [
                                            Color.fromARGB(169, 30, 165, 111),
                                            Color.fromARGB(218, 54, 176, 150), 
                                            ]
                                    ),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: const Text (
                                    "Add License Number",
                                    style: TextStyle (
                                        fontSize: 18.0,
                                        color: Colors.white,
                                    ),
                                ),
                            ),
                    ),
                            ]
                        ),
                    ),
                ],
            ),
        ),
    );
}
}
