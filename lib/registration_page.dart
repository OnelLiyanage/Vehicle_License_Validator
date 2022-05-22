import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_registration_checker/license_data.dart';

class registrationPage extends StatefulWidget {
  const registrationPage({ Key? key }) : super(key: key);

  @override
  State<registrationPage> createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
    final registrationInputController = TextEditingController();

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
                                    validator: (val) {
                                        return val!.isEmpty || val.length < 5 ? null : "Invalid License number" ;
                                    },
                                    controller: registrationInputController,
                                    decoration: const InputDecoration (
                                        hintText: "License number here."
                                        ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.add),   
                                    onPressed: () {
                                        final license = registrationInputController.text;
                                        createRegistration (license: license);
                                    }
                                ),
                            ] 
                        ),
                    ),
                    const SizedBox( height : 25.0),
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

  Future createRegistration({required String license}) async {
      final docUser = FirebaseFirestore.instance.collection('registered-numbers').doc('my-id');

      final licenseNumber = License(
          id: docUser.id,
          license: license,
        );

        final json = licenseNumber.toJson();

        await docUser.set(json);
    }
  
  
}