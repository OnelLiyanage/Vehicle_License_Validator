import 'package:flutter/material.dart';

class checkerPage extends StatefulWidget {
  const checkerPage({ Key? key }) : super(key: key);

  @override
  State<checkerPage> createState() => _checkerPageState();
}

class _checkerPageState extends State<checkerPage> {
    TextEditingController licenseNumber = TextEditingController();
    checkValidity () { 

        String numberLicense = licenseNumber.text.replaceAll(RegExp(r"\s+\b|\b\s"), "");
        numberLicense =numberLicense.toUpperCase();
        int licenseLength = numberLicense.length;
        print(numberLicense);
        print(licenseLength);

        //  7 digit license plate validation
        if (licenseLength == 7) {

            String sectionOne = numberLicense.substring(0,2);
            String sectionTwo = numberLicense.substring(2,3);
            String sectionThree = numberLicense.substring(3,7);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]")) ) {
                print("Old License");
                print("--------------------------");
            
            showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog(
                            title:  const Center(
                                child: Text("Old License")
                            ),
                            content: Text('"'+numberLicense+'"'+" is an older license number.\nCompletely Valid.")
                        );
            });
            } else {
                print("Invalid");
                print("--------------------------");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+numberLicense+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
            }
        } else {
            print("Not in range for 7");
            print("--------------------------");
        }

        //  8 digit license plate validation
        if (licenseLength == 8) {
          
            String sectionOne = numberLicense.substring(0,3);
            String sectionTwo = numberLicense.substring(3,4);
            String sectionThree = numberLicense.substring(4,8);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                print("Old License 2");
                print("--------------------------");
            showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog(
                            title:  const Center(child: Text("Old License")),
                            content: Text('"'+numberLicense+'"'+" is an older license number.\nCompletely Valid.")
                        );
            });
            } else {
                if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                    print("Modern");
                print("--------------------------");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+numberLicense+'"'+" is an newer license number.\nCompletely Valid.")
                    );
                });
                } else {
                    showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+numberLicense+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
                }
            }
        }

        //  9 digit license plate validation
        if (licenseLength == 9) {

            String sectionOne = numberLicense.substring(0,4);
            String sectionTwo = numberLicense.substring(4,5);
            String sectionThree = numberLicense.substring(5,9);

            if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[P]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                print("Modern");
                print("--------------------------");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("New License")),
                        content: Text('"'+numberLicense+'"'+" is an newer license number.\nCompletely Valid.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+numberLicense+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
            }
        } else {
            print("Not in range for 9");
            print("--------------------------");
        }

        //  10 digit vintage license plate validation
        if (licenseLength == 10) {

            String sectionOne = numberLicense.substring(0,2);
            String sectionTwo = numberLicense.substring(2,6);
            String sectionThree = numberLicense.substring(6,10);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[SHRI]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {
                print("Vintage");
                print("--------------------------");
                sectionTwo = sectionTwo.replaceAll("SHRI", "ශ්‍රී");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(child: Text("Vintage License")),
                        content: Text('"'+sectionOne+sectionTwo+sectionThree+'"'+" is a vintage license number.\nCompletely Valid.")
                    );
                });
            } else {
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog(
                        title:  const Center(
                            child: Text("Invalid Number")
                        ),
                        content: Text('"'+numberLicense+'"'+" is not a license number.\nCompletely Invalid.")
                    );
                });
            }
        } else {
            print("Not in range for 9");
            print("--------------------------");
        }


    }

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
                                    controller: licenseNumber,
                                    decoration: const InputDecoration (
                                        hintText: "License number here."
                                        ),
                                ),
                            ]
                        ),
                    ),
                    const SizedBox( height : 25.0),
                    GestureDetector(
                        onTap: () {
                            checkValidity();
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if ( !currentFocus.hasPrimaryFocus ) {
                                currentFocus.unfocus();
                            }
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient (
                                    colors:  [
                                        Color.fromARGB(169, 49, 163, 139),
                                        Color.fromARGB(178, 49, 163, 138), 
                                        ]
                                ),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Text (
                                "Check Validity",
                                style: TextStyle (
                                    fontSize: 18.0,
                                    color: Colors.white,
                                ),
                            ),
                        ),
                    ),
                ],
            ),
        ),
        
    );
}   }

