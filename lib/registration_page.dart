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
        print(registrationInput);
        print(licenseLength);

        if (licenseLength == 7 ) {
            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
            } else {
                print("invalid bitch");
            }
        } else if (licenseLength == 8) {

            String sectionOne = registrationInput.substring(0,3);
            String sectionTwo = registrationInput.substring(3,4);
            String sectionThree = registrationInput.substring(4,8);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                print("Old License 2");
                print("--------------------------");
            showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog(
                            title:  const Center(child: Text("Old License")),
                            content: Text('"'+registrationInput+'"'+" is an older license number.\nCompletely Valid.")
                        );
            });
            } else {
                if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                    createRegistration(license: license);
                    print("Modern");
                print("--------------------------");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+registrationInput+'"'+" is an newer license number.\nCompletely Valid.")
                    );
                });
                } else {
                    showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
                }
            }
        } else
        //  9 digit license plate validation
        if (licenseLength == 9) {

            if (registrationInput.contains(RegExp(r"^[a-zA-Z]+[P]+[a-zA-Z]+[a-zA-Z]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                print("Modern");
                print("--------------------------");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+registrationInput+'"'+" is an newer license number.\nCompletely Valid.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
            }
        } else {
            print("Not in range for 9");
            print("--------------------------");
        }

        //  10 digit vintage license plate validation
        if (licenseLength == 10) {
            String sectionOne = registrationInput.substring(0,2);
            String characterSpecail = registrationInput.substring(2,6);
            String sectionThree = registrationInput.substring(6,10);

            if (registrationInput.contains(RegExp(r"^[0-9]+[0-9]+[SHRI]+[0-9]+[0-9]+[0-9]+[0-9]"))) {
                createRegistration(license: license);
                print("Vintage");
                print("--------------------------");
                characterSpecail = characterSpecail.replaceAll("SHRI", "ශ්‍රී");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("Vintage License")),
                        content: Text('"'+sectionOne+characterSpecail+sectionThree+'"'+" is a vintage license number.\nCompletely Valid.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+registrationInput+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
            }
        } else { 
            print("Not in range for 9");
            print("--------------------------");
        }
        

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
        alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            child: Column (
                mainAxisSize: MainAxisSize.min,
                children: [
                    Text("If the number contains 'xxශ්‍රීxxxx' type it as 'xxSHRIxxxx'. "),
                    Form (
                        child: Column (
                            children: [
                                TextFormField(
                                    controller: registrationInputController,
                                    decoration: const InputDecoration (
                                        hintText: "License number here."
                                        ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.add),   
                                    onPressed: () {
                                        final license = registrationInputController.text;
                                        validatingInput(license);
                                        // createRegistration (license: license);
                                    }
                                ),
                            ] 
                        ),
                    ),
                    const SizedBox( height : 25.0),
                    // StreamBuilder <List<License>>(
                    //     stream: readUsers(),
                    //     builder: (context, snapshot) {
                    //         if (snapshot.hasError) {
                    //             return Text ("There is no data to be shown");
                    //         } else if(snapshot.hasData) {
                    //             final licenseNumbers = snapshot.data!;
                    //             return ListView(
                    //                 children: licenseNumbers.map(displayNumbers).toList(),
                    //             );
                    //         } else {
                    //             return Center (
                    //                 child: CircularProgressIndicator()
                    //             );
                    //         }
                    //     }
                    // ),
                    // GestureDetector(
                    //     onTap: () {
                            
                    //         // addNumber(license: userInput);
                    //         // checkValidity();
                    //         FocusScopeNode currentFocus = FocusScope.of(context);
                    //         if ( !currentFocus.hasPrimaryFocus ) {
                    //             currentFocus.unfocus();
                    //         }
                    //     },
                    //     child: Container(
                    //         alignment: Alignment.center,
                    //         width: MediaQuery.of(context).size.width,
                    //         padding: const EdgeInsets.symmetric(vertical: 20),
                    //         decoration: BoxDecoration(
                    //             gradient: const LinearGradient (
                    //                 colors:  [
                    //                     Color.fromARGB(169, 49, 163, 139),
                    //                     Color.fromARGB(178, 49, 163, 138), 
                    //                     ]
                    //             ),
                    //             borderRadius: BorderRadius.circular(25)
                    //         ),
                    //         child: const Text (
                    //             "Check Validity",
                    //             style: TextStyle (
                    //                 fontSize: 18.0,
                    //                 color: Colors.white,
                    //             ),
                    //         ),
                    //     ),
                    // ),
                ],
            ),
        ),
      
    );
  }
  }