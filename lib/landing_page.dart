// ignore_for_file: unnecessary_const, camel_case_types

import 'package:flutter/material.dart';
import 'package:vehicle_registration_checker/checker_page.dart';
import 'package:vehicle_registration_checker/registered_numbers.dart';
import 'package:vehicle_registration_checker/registration_page.dart';

class landingPage extends StatefulWidget {
  const landingPage({ Key? key }) : super(key: key);

  @override
  State<landingPage> createState() => _landingPageState();
}
// Main page with three options for,
            // Validating Numbers
            // Adding New Numbers
            // Viewing Existing Numbers
class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          toolbarHeight: 70,
        title: const Center(
          child: Text (
            "Validatation for Vehicles",
            style: TextStyle (
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),

      body: Container ( 
          decoration: const BoxDecoration (
              gradient: const LinearGradient (
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight, 
                  colors: [
                    const Color.fromARGB(226, 214, 232, 223),
                    const Color.fromARGB(194, 253, 253, 253),
                  ],
              )
          ),

        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                const SizedBox( height: 120,),

                GestureDetector(
                    onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => const checkerPage()
                            ));
                    },

                    child: const Center (
                    child: const Card (
                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child : Padding (
                            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 25.0),
                        child: const Text (
                            "Date License Number",
                            style : TextStyle (
                                fontSize: 18.0,
                                color : Colors.black,
                                ),
                            ),
                        ),
                    ),
                ),
                ),

                const SizedBox( height: 40),

                GestureDetector(
                    onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => const registrationPage()
                            ));
                    },

                    child: const Center (
                    child: const Card (
                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child : Padding (
                            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 25.0),
                        child: const Text (
                            "Add New Number",
                            style : TextStyle (
                                fontSize: 18.0,
                                color : Colors.black,
                                ),
                            ),
                        ),
                    ),
                ),
                ),

                const SizedBox( height: 40),
                
                GestureDetector(
                    onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => const registeredNumbers()
                            ));
                    },
                    
                    child: const Center (
                    child: const Card (
                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child : Padding (
                            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 25.0),
                        child: const Text (
                            "All Registered Numbers",
                            style : TextStyle (
                                fontSize: 18.0,
                                color : Colors.black,
                                ),
                            ),
                        ),
                    ),
                ),
                ),

            ],
        ),
      ),
    );
  }
}