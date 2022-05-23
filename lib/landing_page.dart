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

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
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
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 25.0),
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
                          padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 25.0),
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
      
    );
  }
}