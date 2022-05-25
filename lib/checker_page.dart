import 'package:flutter/material.dart';

class checkerPage extends StatefulWidget {
  const checkerPage({ Key? key }) : super(key: key);

  @override
  State<checkerPage> createState() => _checkerPageState();
}

class _checkerPageState extends State<checkerPage> {

    TextEditingController licenseNumber = TextEditingController();      // Value entered in the form to determine date

    // Function to determine type
    checkType () { 

        String numberLicense = licenseNumber.text.replaceAll(RegExp(r"\s+\b|\b\s"), "");        //removes all whitespaces from user input
        numberLicense =numberLicense.toUpperCase();                                                             //convert user input to uppercase to eliminate futher bugs
        int licenseLength = numberLicense.length;

        //  7 digit license plate validation
        if (licenseLength == 7) {
            if (numberLicense.contains(RegExp(r"^[0-9]+[0-9]+[-]+[0-9]+[0-9]+[0-9]+[0-9]")) ) {         // Regular expression for valid 7 digit license numbers
            showDialog(context: context, builder: (BuildContext context){                                                    // DialogBox with pop up 
                        return AlertDialog (
                        title:  const Center (
                                child: Text("Old License Number")
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
                                      Text('"'+numberLicense+'"'+" is an older license number.")
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
                        content: Text('"'+numberLicense+'"'+" is not a license number.")
                    );
                });
            }
        } else 
        //  8 digit license plate validation
        if (licenseLength == 8) {
          
            String sectionOne = numberLicense.substring(0,3);
            String sectionTwo = numberLicense.substring(3,4);
            String sectionThree = numberLicense.substring(4,8);

            if (sectionOne.contains(RegExp(r"^[0-9]+[0-9]+[0-9]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {         // Regular expression for Old valid 8 digit license numbers
            
            showDialog(context: context, builder: (BuildContext context){ 
                        return AlertDialog (
                        title:  const Center (
                                child: Text("Old License Number")
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
                                      Text('"'+numberLicense+'"'+" is an older license number.")
                                    ],
                                  ),
                            ]
                        )
                    );
            });
            } else {
                if (sectionOne.contains(RegExp(r"^[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")) && sectionTwo.contains(RegExp(r"^[-]")) && sectionThree.contains(RegExp(r"^[0-9]+[0-9]+[0-9]+[0-9]"))) {    // Regular expression for Modern valid 8 digit license numbers
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Modern License Number")
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
                                      Text('"'+numberLicense+'"'+" is a modern license number.")
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
                        content: Text('"'+numberLicense+'"'+" is not a license number.")
                    );
                });
                }
            }
        } else 
        //  9 digit license plate validation
        if (licenseLength == 9) {

            if (numberLicense.contains(RegExp(r"^[a-zA-Z]+[P]+[a-zA-Z]+[a-zA-Z]+[-]+[0-9]+[0-9]+[0-9]+[0-9]"))) {           // Regular expression for Modern valid 9 digit license numbers
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Modern License Number")
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
                                      Text('"'+numberLicense+'"'+" is a modern license number.")
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
                        content: Text('"'+numberLicense+'"'+" is not a license number.")
                    );
                });
            }
        } else 
        //  10 digit vintage license plate validation
        // For the vintage number plates users must enter it replacing the ශ්‍රී character with 'shri'.
        if (licenseLength == 10) {

            String sectionOne = numberLicense.substring(0,2);
            String sectionTwo = numberLicense.substring(2,6);
            String sectionThree = numberLicense.substring(6,10);

            if (numberLicense.contains(RegExp(r"^[0-9]+[0-9]+[SHRI]+[0-9]+[0-9]+[0-9]+[0-9]"))) {          // Regular expression for valid vintage license numbers
                
                sectionTwo = sectionTwo.replaceAll("SHRI", "ශ්‍රී");
                showDialog(context: context, builder: (BuildContext context){ 
                    return AlertDialog (
                        title:  const Center (
                                child: Text("Vintage License Number")
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
                                      Text('"'+sectionOne+sectionTwo+sectionThree+'"'+" is  a vintage registration.")
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
                        content: Text('"'+numberLicense+'"'+" is not a license number.")
                    );
                });
            }
        } else {                                                                                                    // if the input doesn't satisfy any of the above it can determined as an invalid input
            showDialog(context: context, builder: (BuildContext context){ 
                return AlertDialog(
                    title:  const Center(
                        child: Text("Invalid Number")
                    ),
                    content: Text('"'+numberLicense+'"'+" is not a valid license number.\n Please check the format.")
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
                    const SizedBox(height: 20),
                    Form (                                                                                               // Form containg the field for user to input the license number
                        child: Column (
                            children: [
                                TextFormField(
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
                            checkType();
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if ( !currentFocus.hasPrimaryFocus ) {
                                currentFocus.unfocus();
                            }
                            licenseNumber.clear();
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
                                "Check Vehicle Type",
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

